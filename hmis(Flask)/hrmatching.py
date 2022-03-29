# -*- coding: utf-8 -*-

# 필요한 라이브러리 설치
#!pip install transformers 
#!pip install sentencepiece
#!pip install tensorflow_addons

# 사용할 패키지 import
import pandas as pd
import numpy as np
import os
from sklearn.model_selection import train_test_split
import tensorflow as tf
from transformers import *
from tqdm import tqdm
import tensorflow_addons as tfa

"""
환경변수 설정
환경변수 : 운영체제에 로그인한 사용자가 어떤 위치에서든 확인할 수 있는 값을 의미
(어떤 환경에서든 쉽게 참조할 수 있도록 설정할 수 있는 값)
"""
os.environ["CUDA_DEVICE_ORDER"] = "PCI_BUS_ID" # GPU 장치 0부터 정렬
os.environ["CUDA_VISIBLE_DEVICES"] = "" # 사용할 GPU를 번호로 지정

# 학습에 필요한 csv 파일을 pandas 패키지의 함수를 사용하여 불러온뒤 user 변수에 저장
user = pd.read_csv('C:/workspace/Spyder/Flask/hmis/read_csv/User_20200225_949.csv', names="user_id,name,birth,sex,addr,univ,education,major,work_period,work_company,skill,pay,profession,profession_detail,resume".split(","),encoding='cp949')
print("Number of User Profile = ", len(user))

# 학습에 필요한 csv 파일을 pandas 패키지의 함수를 사용하여 불러온뒤 applyHistory 변수에 저장
applyHistory = pd.read_csv('C:/workspace/Spyder/Flask/hmis/read_csv/matchHistory1for7.csv',names="user_id,order_id,rating".split(","))
print("Number of Apply History = ", len(applyHistory))

# pd.merge 함수를 사용하여 데이터 프레임 합친 후 tempJoinSet 변수에 저장
tempJoinSet = pd.merge(applyHistory, user, left_on='user_id', right_on="user_id")
print("Number of user+history Joined Dataset = ", len(tempJoinSet))

# 학습에 필요한 csv 파일을 pandas 패키지의 함수를 사용하여 불러온뒤 job 변수에 저장
job = pd.read_csv('C:/workspace/Spyder/Flask/hmis/read_csv/Order_20200225_chg.csv', names="order_id,job_name,company_size,company_overview,job_desc,job_requirement,etc".split(","), encoding='cp949')
print("Number of job Profile = ", len(job))

# pd.merge 함수를 사용하여 데이터 프레임 합친 후 joinSet 변수에 저장
joinSet = pd.merge(tempJoinSet, job, left_on='order_id', right_on="order_id")
print("Number of user+job+history Joined Dataset = ", len(joinSet))

# numpy 라이브러리를 사용하여 구직자 프로파일 벡터 생성
# 가장 자주 사용되는 2000단어만을 사용하여 사전을 구성. 시퀀스 길이를 200단어로 제한.
# pandas에서 astype(str) 함수를 사용하 DataFrame 열을 문자열로 변환

# User 프로파일 벡터(열) 만들기 :
joinSet['userProfile'] = joinSet['sex'].astype(str)+" "+joinSet['addr'].astype(str)+" "+joinSet['education'].astype(str)+" "+joinSet['major'].astype(str)+" "+joinSet['skill'].astype(str)+" "+joinSet['profession'].astype(str)+" "+joinSet['profession_detail'].astype(str)

# Job공고 프로파일 벡터(열) 만들기 : 채용직무 + 기업형태 + 회사소개 + 직무소개 + 자격요건 + 우대사항 
# joinSet['jobProfile'] = joinSet['job_name'].astype(str)+" "+joinSet['job_desc'].astype(str)+" "+joinSet['job_requirement'].astype(str)+" "+joinSet['etc'].astype(str)
joinSet['jobProfile'] = joinSet['job_name'].astype(str)+" "+joinSet['company_size'].astype(str)+" "+joinSet['company_overview'].astype(str)+" "+joinSet['job_desc'].astype(str)+" "+joinSet['job_requirement'].astype(str)+" "+joinSet['etc'].astype(str)

# joinSet 데이터 상위 2건 출력 
joinSet.head(2)

# joinSet에서 필요한 열의 데이터만 추출하여 train 변수에 저장
train = joinSet[['user_id',	'order_id',	'rating', 'userProfile', 'jobProfile']]
# train에서 rating열의 데이터만 가져와 numpy의 array 형태로 trainy 변수에 저장 
trainy = np.array(train['rating'])

# scikit-learn의 model_selection 패키지 안에 train_test_split 모듈을 활용하여 train set(학습 데이터 셋)과 test set(테스트 셋)을 분리
x_train, x_test, y_train, y_test = train_test_split(train, trainy, test_size=0.2, random_state=7000)
# pandas의 DataFrame에 reset_index 메소드를 사용하여 훈련데이터의 인덱스를 리셋시키고 새로운 복사본 객체를 생성하지 않고 원본 객체를 변경(inplace=True)
x_train.reset_index(inplace=True)
print(x_train.shape, y_train.shape)
# pandas의 DataFrame에 reset_index 메소드를 사용하여 테스트데이터의 인덱스를 리셋시키고 새로운 복사본 객체를 생성하지 않고 원본 객체를 변경(inplace=True)
x_test.reset_index(inplace=True)
print(x_test.shape, y_test.shape)
# 테스트데이터 출
x_test.head()

"""
토큰화 : tokenizer를 사용하여 wordpiece를 만들어 토큰화가 이루어진다.
BERT tokenizer는 BERT와 함께 작동하는 tokenizer는이다.
from_pretrained(‘bert-base-multilingual-cased’)를 사용함으로써 google에서 pretrained한 모델을 사용할 수 있다.
"""
tokenizer = BertTokenizer.from_pretrained('bert-base-multilingual-cased')

def convert_data(data_df):
    global tokenizer
    indices, segments, masks = [], [], []

    for i in tqdm(range(len(data_df))):
        # que : userProfile을 버트 인풋으로 들어갈 수 있게 토큰화 한 변수, tokenizer.encode를 사용하면
        # 토큰화 된 리스트와, 세그먼트가 같이 나오는데 일단 토큰화 된 리스트만 사용
        que = tokenizer.encode(data_df[USER_COLUMN][i])
        # doc : jobProfile을 버트 인풋으로 들어갈 수 있게 토근화 한 변수
        doc = tokenizer.encode(data_df[JOB_COLUMN][i])
        
        # 토큰화된 jobProfile의 맨 앞에 있는 [CLS]에 해당하는 101을 삭제
        doc.pop(0)

        # que_len, doc_len : userProfile의 길이, jobProfile의 길이
        que_len = len(que)
        doc_len = len(doc)

        # 만약 userProfile의 길이가 100을 초과하면, 100으로 잘라줌
        if que_len > 100:
          que = que[:99]
          # 질문의 끝이 [SEP]이 되도록, [SEP]에 해당하는 102 추가
          que.append(102)
        
        # 버트 인풋으로 들어가는 토큰화된 리스트가 최대 길이인 384가 넘지 않도록 만들어 줌
        # 384 미만이면 jobProfile을 잘라줌
        if len(que+doc) > SEQ_LEN:
          while len(que+doc) != SEQ_LEN:
            doc.pop(-1)
          doc.pop(-1)
          #context의 끝이 [SEP]가 되도록 [SEP]에 해당하는 102를 추가해 줌
          doc.append(102)

        # 문장의 전후관계를 구분해주는 segment는, userProfile은 0 이 되도록, JobProfile는 1이 되도록, 나머지 부분인 패딩 부분은
        # 0이 되도록 만들어 줌
        
        ############################
        ###### Segment 예시 ########
        ############################
        
        # userProfile, JobProfile, padding
        # 00000000, 1111111, 0000000
        
        segment = [0]*len(que) + [1]*len(doc) + [0]*(SEQ_LEN-len(que)-len(doc))
        if len(que + doc) <= SEQ_LEN:
          mask = [1]*len(que+doc) + [0]*(SEQ_LEN-len(que+doc))
        else:
          mask = [1]*len(que+doc)
        # 만약 userProfile과 JobProfile을 합쳤을 때 그 길이가 384 미만이면
        # padding 값인 0을 채워주도록 함
        if len(que + doc) <= SEQ_LEN:
          while len(que+doc) != SEQ_LEN:
            doc.append(0)

        # ids : userProfile과 JobProfile을 합친 BERT의 실질적인 인풋
        ids = que + doc
        
        # BERT input으로 들어가는 ids, segments를 indices, segments에 각각 저장
        indices.append(ids)
        segments.append(segment)
        masks.append(mask)

    # indices, segments를 numpy array로 지정    
    indices_x = np.array(indices)
    segments = np.array(segments)
    masks = np.array(masks)
    
    return [indices_x, masks, segments]

# 위에 정의한 convert_data 함수를 불러오는 함수를 정의
def load_data(pandas_dataframe):
    data_df = pandas_dataframe
    data_df[JOB_COLUMN] = data_df[JOB_COLUMN].astype(str)
    data_df[USER_COLUMN] = data_df[USER_COLUMN].astype(str)
    data_x = convert_data(data_df)

    return data_x

SEQ_LEN = 384
JOB_COLUMN = 'jobProfile'
USER_COLUMN = 'userProfile'

train_x = load_data(x_train)
test_x = load_data(x_test)
train_y = y_train
test_y = y_test 
train_x[0:3] # [indices_x, masks, segments]



# Rectified Adam 옵티마이저 사용
opt = tfa.optimizers.RectifiedAdam(lr=1.0e-5, weight_decay=0.0025)

sentiment_model = tf.keras.Model()

def create_sentiment_bert():
  # 버트 pretrained 모델 로드 (다국어모델)
  model = TFBertModel.from_pretrained('bert-base-multilingual-cased')
  # 토큰 인풋, 마스크 인풋, 세그먼트 인풋 정의
  token_inputs = tf.keras.layers.Input((SEQ_LEN,), dtype=tf.int32, name='input_word_ids')
  mask_inputs = tf.keras.layers.Input((SEQ_LEN,), dtype=tf.int32, name='input_masks')
  segment_inputs = tf.keras.layers.Input((SEQ_LEN,), dtype=tf.int32, name='input_segment')
  # 인풋이 [토큰, 마스크, 세그먼트]인 모델 정의
  bert_outputs = model([token_inputs, mask_inputs, segment_inputs])

  bert_outputs = bert_outputs[1]
  
  sentiment_first = tf.keras.layers.Dense(1, activation='sigmoid', kernel_initializer=tf.keras.initializers.TruncatedNormal(stddev=0.02))(bert_outputs)
  sentiment_model = tf.keras.Model([token_inputs, mask_inputs, segment_inputs], sentiment_first)

  sentiment_model.compile(optimizer=opt, loss=tf.keras.losses.BinaryCrossentropy(), metrics = ['accuracy'])
  return sentiment_model

strategy = tf.distribute.MirroredStrategy()

with strategy.scope():
    sentiment_model = create_sentiment_bert()
    sentiment_model.fit(train_x, train_y, epochs=4, shuffle=True, validation_data=(test_x, test_y))  


def trainHR():
    return sentiment_model


