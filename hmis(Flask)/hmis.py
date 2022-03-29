# -*- coding: utf-8 -*-

from flask import Flask, request, jsonify
import topNRecommender as TOPR

app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = False

@app.route('/')
def hello_pybo():
    return '안녕하세요. (주)T&B의 인재매칭시스템입니다.'

@app.route('/topNHrs')
def recHr():
    # http://127.0.0.1:5000/topNHrs?num=5&jobID=305
    
    ot = {} # ot 변수에 빈 딕셔너리 생성
    
    """
     <<GET으로 데이터를 받아 오는 방법>>
     주소창(GET)에서 쿼리스트링으로 URL의 끝에 ?와 함께 key와 value로 쌍을 이루는 요청 파라미터(파라미터가 여러 개이면 &로 연결)가 들어 오기 때문에
     Arguments (차이는 있지만 (인수 = 매개 변수 = 파라미터) 로 이해) 로 받아서 처리 한다.
    보통 다른언어에서도 많이 쓰이는 Arguments 표현은 args로 되고 배열에 값이 담기게 된다.
    """
    
    # 1
    """
    if문 : GET 방식으로 요청 받은 request.args에 'num'이라는 문자열이 있다면 수행 
    else문 : GET 방식으로 요청 받은 request.args에 'num'이라는 문자열이 없다면 수행 
    """
    if 'num' in request.args:
        snum = request.args['num']  # 요청받은 'num'이라는 key값의 value값을 snum 변수에 저장
    else:
        ot['statusCode'] = '101' # 미리 생성된 ot라는 빈 딕셔너리에 'statusCode'라는 key값과 '101'라는 value값을 저장
        ot['msgStr'] = 'request num missing error' # 미리 생성된 ot라는 빈 딕셔너리에 'msgStr'라는 key값과 'request num missing error'라는 value값을 저장
        return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴
     
    # 2   
    """
    if문 : GET 방식으로 요청 받은 request.args에 'jobID'이라는 문자열이 있다면 수행
    else문 : GET 방식으로 요청 받은 request.args에 'jobID'이라는 문자열이 있다면 없다면 수행
    """
    if 'jobID' in request.args:
        sjobID = request.args['jobID'] # 요청받은 'jobID'이라는 key값의 value값을 sjobID 변수에 저장
    else:
        ot['statusCode'] = '101' # 미리 생성된 ot라는 빈 딕셔너리에 'statusCode'라는 key값과 '101'라는 value값을 저장
        ot['msgStr'] = 'request jobID missing error' # 미리 생성된 ot라는 빈 딕셔너리에 'msgStr'라는 key값과 'request num missing error'라는 value값을 저장
        return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴

    inum = int(snum) # inum이라는 변수에 snum 변수에 저장된 데이터를 int타입으로 변환하여 저장
    
    print ('inum = % 3d, sjobID = %s' % (inum, sjobID)) # inum과 sjobID에 저장된 데이터 출력
    (st, msgStr, recHrSet) = TOPR.topNhr(inum, sjobID) # topNRecommender.py 파일의 topN 함수에 inum, sjobID 변수의 데이터를 전달하여 받은 리턴값을 각각의 st, msgStr, recHrSet 변수에 저장

    ot['statusCode'] = st # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'statusCode'라는 key값의 value값에 st 변수에 저장된 데이터를 저장
    ot['msgStr'] = msgStr # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'msgStr'라는 key값의 value값에 msgStr 변수에 저장된 데이터를 저장
    ot['recHrSet'] = recHrSet  # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'recHrSet'라는 key값의 value값에 recHrSet 변수에 저장된 데이터를 저장
    
    return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴

@app.route('/topNJobs')
def recJob():
    # http://127.0.0.1:5000/topNJobs?num=5&hrID=20162398
    ot = {} # ot 변수에 빈 딕셔너리 생성
    
    """
     <<GET으로 데이터를 받아 오는 방법>>
     주소창(GET)에서 쿼리스트링으로 URL의 끝에 ?와 함께 key와 value로 쌍을 이루는 요청 파라미터(파라미터가 여러 개이면 &로 연결)가 들어 오기 때문에
     Arguments (차이는 있지만 (인수 = 매개 변수 = 파라미터) 로 이해) 로 받아서 처리 한다.
    보통 다른언어에서도 많이 쓰이는 Arguments 표현은 args로 되고 배열에 값이 담기게 된다.
    """
    
    # 1
    """
    if문 : GET 방식으로 요청 받은 request.args에 'num'이라는 문자열이 있다면 수행 
    else문 : GET 방식으로 요청 받은 request.args에 'num'이라는 문자열이 없다면 수행 
    """
    if 'num' in request.args:
        snum = request.args['num']  # 요청받은 'num'이라는 key값의 value값을 snum 변수에 저장
    else:
        ot['statusCode'] = '101' # 미리 생성된 ot라는 빈 딕셔너리에 'statusCode'라는 key값과 '101'라는 value값을 저장
        ot['msgStr'] = 'request num missing error' # 미리 생성된 ot라는 빈 딕셔너리에 'msgStr'라는 key값과 'request num missing error'라는 value값을 저장
        return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴
     
    # 2   
    """
    if문 : GET 방식으로 요청 받은 request.args에 'hrID '이라는 문자열이 있다면 수행
    else문 : GET 방식으로 요청 받은 request.args에 'hrID '이라는 문자열이 있다면 없다면 수행
    """
    if 'hrID ' in request.args:
        shrID = request.args['hrID'] # 요청받은 'jobID'이라는 key값의 value값을 sjobID 변수에 저장
    else:
        ot['statusCode'] = '101' # 미리 생성된 ot라는 빈 딕셔너리에 'statusCode'라는 key값과 '101'라는 value값을 저장
        ot['msgStr'] = 'request hrID  missing error' # 미리 생성된 ot라는 빈 딕셔너리에 'msgStr'라는 key값과 'request num missing error'라는 value값을 저장
        return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴

    inum = int(snum) # inum이라는 변수에 snum 변수에 저장된 데이터를 int타입으로 변환하여 저장
    
    print('inum = % 3d, shrID  = %s' % (inum, shrID )) # inum과 sjobID에 저장된 데이터 출력
    (st, msgStr, recJobSet ) = TOPR.topNjob(inum, shrID) # topNRecommender.py 파일의 topN 함수에 inum, sjobID 변수의 데이터를 전달하여 받은 리턴값을 각각의 st, msgStr, recHrSet 변수에 저장

    ot['statusCode'] = st # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'statusCode'라는 key값의 value값에 st 변수에 저장된 데이터를 저장
    ot['msgStr'] = msgStr # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'msgStr'라는 key값의 value값에 msgStr 변수에 저장된 데이터를 저장
    ot['recJobSet '] = recJobSet   # 미리 생성된 ot라는 딕셔너리 형태의 변수에 'recHrSet'라는 key값의 value값에 recHrSet 변수에 저장된 데이터를 저장
    
    return jsonify(ot) # ot 변수에 저장된 데이터를 jsonify함수에 전달하여 JSON 응답 리턴


""" 
if문 : 현재파일(hmis.py) 안에 존재하는 함수를 직접 사용하는 경우 수행
else문 : 다른 파일에서 현재(hmis.py)파일을 import하여 현재 파일 안에 존재하는 함수를 사용하는 경우 수행
""" 
if __name__ == '__main__':
    print("직접 실행")
    print(__name__) # 직접 사용하는 경우 "__main__"이 출력됨
    """
    <<수정사항 실시간 반영방법>>
    flask를 기본으로 app.run()으로 실행할경우 해당서버는 기본적으로 운영모드로 개발하게 되며 수정한 파일들이 실시간으로 반영되지 않기때문에 재가동을 해야한다.
    debug모드를 사용하면 개발중 수정한 사항이 실시간으로 반영되어 서버가 자동으로 재가동 된다.
    """
    #app.run(debug=True, host='127.0.0.1:5000', port=80)
    app.run(debug=True)
else:
    print("import되어 사용됨")
    print(__name__) # import 되어 사용되는 경우 사용하는 파일명 출력