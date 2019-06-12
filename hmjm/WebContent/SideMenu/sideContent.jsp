<!-- 레이어팝업창 내용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#css_tabs {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}

/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1),
#css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2),
#css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3) {
    display:block
}

/* 라벨 기본 스타일 지정 */
#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:20%;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:1.5em
}

/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:tomato;
    color:#fff
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:gold;
    color:#fff
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    background:green;
    color:#fff
}

/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content {
    padding:2em;
    border:1px solid #ddd;
    width:80%;
    height:100%
}

</style>
</head>
<body>
 <div id="css_tabs">
        <!-- 라디오 버튼 -->
        <input id="tab1" type="radio" name="tab" checked="checked" />
        <input id="tab2" type="radio" name="tab" />
        <input id="tab3" type="radio" name="tab" />

        <!-- 라벨 : 화면에 표시되는 탭 제목 -->
        <label for="tab1">Tab 1</label>
        <label for="tab2">Tab 2</label>
        <label for="tab3">Tab 3</label>

        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
        <div class="tab1_content">
<p>
1. 수업 신청 후 절차가 어떻게 되나요?
수업신청은 " 수업신청서 발급 >> 결제완료 >> 튜터님의 수업승인 >> 수업매칭" 으로 절차가 진행됩니다!
튜터님과 연결되시면 일정을 조율하여 첫 수업날짜를 잡아보세요

2. 수업료는 어떻게 결제하나요? 
원데이 수업 : 전체수업료를 한번에 결제하는 전체결제로 진행이 됩니다
2회차 이상의 수업 :
1. 전체수업료를 한번에 결제하기(전체결제) : 탈잉에서 전체수업료를 가지고 있다가 첫 수업이 마친 후 탈잉 수수료인 1시간 수업료를 제외한 나머지 금액을 튜터님께 돌려드리고 있어요
2. 1시간의 수업료를 예약금으로 결제하기 : 튜터분과 첫 수업을 진행하신 다음, 향후 수업료는 튜터에게 직접 전달해주시면 됩니다. (수업료는 계좌이체 등으로 송금 근거를 남겨 두시길 권장합니다.)

3. 결제방식은 어떻게 되나요? 
원데이 수업 : 앱과 PC에서 카드/무통장으로 결제하실 수 있어요
2회차 이상의 수업 : 앱, PC(동일) - 수업료 전체결제 / 1시간의 수업료를 예약금으로 카드/무통장으로 결제하실 수 있어요

4. 세금계산서 / 현금영수증은 어떻게 발급받을 수 있나요? 
전체수업료를 탈잉으로 결제하신 다음 카카오톡 플러스친구 탈잉센터로 말씀해주시면 발급해드립니다.

5. 수업장소와 시간은 어떻게 되나요? 
수업소개에 수업장소와 시간이 명시되어 있습니다. 자세히 명시 되어있지 않은 수업의 경우 튜터와 조율하여 유동적으로 결정할 수 있습니다.
튜터에게 문의하여 시간을 조율해보세요. 개개인의 스케줄에 딱 맞는 시간을 조율할 수 있다는 것이 탈잉의 가장 큰 장점이니까요.
</p>
        </div>
        <div class="tab2_content">
6. 수업을 신청하기 전, 튜터님께 수업의 커리큘럼 혹은 일정에 관해 어떻게 질문을 할 수 있나요? 
수업소개서 안에 있는 실시간톡을 클릭하여 튜터님과 수업신청 전에 커리큘럼 혹은 일정에 관해 이야기 해보세요.

7. 튜터들의 수업 퀄리티를 신뢰할 수 있을까요? 
탈잉에서 튜터에 대한 철저한 사전검증을 하게 되며, 프로필 상의 경력과 자격증에 대한 검수확인 과정을 거치게 됩니다.
또한 실제 수업을 들었던 수강생의 리뷰와 피드백을 통해 튜터의 평판을 지속적으로 관리합니다. 탈잉은 계속해서 튜터들의 신뢰도를 높일 수 있는 검증 시스템을 만들어 갈 것임을 약속드립니다.

8. 수업 취소는 어떻게 할 수 있나요? 
첫 수업 24시간 전에 튜터님께 수업취소의사를 전달해주시길 바랍니다. 그 다음, 카카오톡 플러스친구 탈잉센터 를 통해 취소 여부를 알려주세요.

9. 첫 수업 시작 전에 급한 일이 생겼습니다. 환불이 가능할까요? 
첫 수업 24시간 전에 튜터님께 수업취소의사를 전달해주신 경우에는 결제된 수업료가 100% 환불됩니다. 자세한 사안은 환불규정을 참고해주세요

10. 환불 금액은 언제 입금되나요? 
"환불 신청 >> 담당자 확인 후 환불 접수(환불 신청 후 24시간 이내 완료) >> 환불진행(환불액이 재입금 되는 데 영업일 기준 2~3일 정도 소요) >> 환불완료"의 절차로 진행됩니다.
        </div>
        <div class="tab3_content">
11. 수업 중간에 사정이 생겨 그만둘 경우에는 환불이 되나요? 
아뇨.
12. 회원탈퇴는 어떻게 하나요? 
못해요.
        </div>
    </div>
</body>
</html>