# -*- coding: utf-8 -*-

# import pandas as pd
# import numpy as np
# import heapq
# import tensorflow as tf
# from tensorflow import keras
from collections import OrderedDict
import hrmatching as hr


# ipython 사용시 향후 버전이 올라갈 때 변경될 사항 등을 알려주는 경고 메시지(warning message)
import warnings
warnings.filterwarnings('ignore') # 메시지 출력을 원할 때는 ('default')로 수정 

""" 기업 : 학생 추천 """
def topNhr(num, jobID):

    print ("Top ", num, " recommendation for the jobID ", jobID) # num와 jobID 출력
    
    statusCode = "100" # statusCode라는 변수에 "100"이라는 문자열을 저장
    msgStr = "successfully recommended!" # msgStr이라는 변수에 "successfully recommended!"이라는 문자열을 저장
    """
    파이썬 3.6 이전에서는 딕셔너리 형태의 변수에서 사전에 삽입된 데이터를 순서대로 획득할 수가 없었다. 
    따라서 무작위 순서로 데이터를 얻어야 했다.
    파이썬 3.6 이후에는 collections 모듈의 OrderedDict 클래스를 사용하여 데이터의 순서를 보장받을 수 있게 되었다.
    """
    recHrSet = OrderedDict() # ot 변수에 빈 딕셔너리 생성(순서를 고려하기위해서 OrderedDict()를 사용하여 생성)

    """
    if문 : jobID 변수에 빈문자열이 저장되어있는 경우 수행 
    """
    if jobID == "" :
        statusCode = "101" # statusCode라는 변수에 "101"이라는 문자열을 저장
        msgStr = "Input Parameters error" # msgStr이라는 변수에 "successfully recommended!"이라는 문자열을 저장
        return statusCode, msgStr, recHrSet # if문에서 각각 변수에 데이터 저장 후 statusCode, msgStr, recJobSet 변수 리턴
    
    model = hr.trainHR() # 학습된 h5형식의 모델을 케라스 라이브러리의 함수 사용하여 불러온 뒤 model 변수에 저장
    recHrSet = model.predict(jobID) # makeRecSet 함수에 model, num, jobID 변수의 데이터를 전달하여 받은 리턴값을 recHrSet이라는 변수에 저장

    #recHrSet = {'20162398':0.9985185282933657, '20162399':0.9985182282933657, '20162397':0.9985135282933657, '20162396':0.9985185282933657, '20162395':0.9985185282933657}

    print(recHrSet) # recHrSet이라는 변수에 저장된 데이터 출력
    
    #After prediction
    return statusCode, msgStr, recHrSet # 저장된 데이터와 함께 statusCode, msgStr, recHrSet 변수를 리턴

""" 학생 : 채용공고 추천 """
def topNjob(num, hrID):

    print ("Top ", num, " recommendation for the jobID ", hrID) # num와 jobID 출력
    
    statusCode = "100" # statusCode라는 변수에 "100"이라는 문자열을 저장
    msgStr = "successfully recommended!" # msgStr이라는 변수에 "successfully recommended!"이라는 문자열을 저장
    """
    파이썬 3.6 이전에서는 딕셔너리 형태의 변수에서 사전에 삽입된 데이터를 순서대로 획득할 수가 없었다. 
    따라서 무작위 순서로 데이터를 얻어야 했다.
    파이썬 3.6 이후에는 collections 모듈의 OrderedDict 클래스를 사용하여 데이터의 순서를 보장받을 수 있게 되었다.
    """
    recJobSet = OrderedDict() # ot 변수에 빈 딕셔너리 생성(순서를 고려하기위해서 OrderedDict()를 사용하여 생성)

    """
    if문 : jobID 변수에 빈문자열이 저장되어있는 경우 수행 
    """
    if hrID == "" :
        statusCode = "101" # statusCode라는 변수에 "101"이라는 문자열을 저장
        msgStr = "Input Parameters error" # msgStr이라는 변수에 "successfully recommended!"이라는 문자열을 저장
        return statusCode, msgStr, recJobSet # if문에서 각각 변수에 데이터 저장 후 statusCode, msgStr, recJobSet 변수 리턴
    
    model = hr.trainHR() # 학습된 h5형식의 모델을 케라스 라이브러리의 함수 사용하여 불러온 뒤 model 변수에 저장
    recJobSet = model.predict(hrID) # makeRecSet 함수에 model, num, jobID 변수의 데이터를 전달하여 받은 리턴값을 recHrSet이라는 변수에 저장

    # json 전송 테스트시 사용
    # recHrSet = {'20162398':0.9985185282933657, '20162399':0.9985182282933657, '20162397':0.9985135282933657, '20162396':0.9985185282933657, '20162395':0.9985185282933657}

    print(recJobSet) # recHrSet이라는 변수에 저장된 데이터 출력
    
    #After prediction
    return statusCode, msgStr, recJobSet # 저장된 데이터와 함께 statusCode, msgStr, recHrSet 변수를 리턴


"""
if문 : 현재파일(topNRecommender.py) 안에 존재하는 함수를 직접 사용하는 경우 수행
else문 : 다른 파일에서 현재(topNRecommender.py)파일을 import하여 현재 파일 안에 존재하는 함수를 사용하는 경우 수행
"""
if __name__ == "__main__":
    print("직접 실행")
    print(__name__) # 직접 사용하는 경우 "__main__"이 출력됨
    print(topNhr(5, "305")) 
    print(topNjob(5, "20182210"))
else:
    print("import되어 사용됨")
    print(__name__) # import 되어 사용되는 경우 사용하는 파일명 출력
