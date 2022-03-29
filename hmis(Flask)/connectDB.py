# -*- coding: utf-8 -*-

# 링크 수집을 위한 라이브러리 설치
# 오라클 DB 연동을 위한 라이브러리 설치
#!pip install selenium
#!pip install cx_Oracle

import pandas as pd
import cx_Oracle
import os

# 자신이 파일을 저장할 경로를 지정
os.chdir(r'C:\Users\qkrqj\workspace\JupyterNotebook\csv')

os.putenv('NLS_LANG','KOREAN_KOREA.KO16MSWIN949')

"""서버 정보 입력 후 DB 연동"""
# 연결에 필요한 기본 정보 (유저, 비밀번호, 데이터베이스 서버 주소)
database_server = 'localhost/xe'
username = 'HMIS'
password = '1234'

connection = cx_Oracle.connect(username, password, database_server)# DB 연결
cursor = connection.cursor() # 커서 생성

# 테이블 데이터 불러오기
def select(table):
    # 전역변수에 저장된 DB정보 가져오기
    global database_server, username, password, connection, cursor
    # 쿼리문 입력 및 데이터 가져오기
    query = "select*from " + table
    data = pd.read_sql(query,connection)
    # 가져온 데이터 DataFrame 형태로 변환
    df = pd.DataFrame(data)
    
    return df

# 함수를 사용하여 가져온 데이터 변수에 저장
user = select("TBL_USER")
posting = select("TBL_POSTING")

# csv 파일로 내려받기
user.to_csv('user.csv', encoding='UTF-8-SIG')
posting.to_csv('posting.csv', encoding='UTF-8-SIG')