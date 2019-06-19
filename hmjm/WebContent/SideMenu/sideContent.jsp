<%-- 레이어팝업창 내용 --%>
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
1. 수업 신청 후 절차가 어떻게 되나요?<br/>
글쎄요<br/>
2. 수업료는 어떻게 결제하나요?<br/> 
수업신청부터<br/> 
3. 결제방식은 어떻게 되나요? <br/> 
카드요<br/> 
4. 세금계산서 / 현금영수증은 어떻게 발급받을 수 있나요? <br/> 
몰라요<br/> 
5. 수업장소와 시간은 어떻게 되나요? <br/> 
수업설명에 써있어요<br/> 
</p>
        </div>
        <div class="tab2_content">
<p>
6. 수업을 신청하기 전, 튜터님께 수업의 커리큘럼 혹은 일정에 관해 어떻게 질문을 할 수 있나요? <br/> 
네<br/> 
7. 튜터들의 수업 퀄리티를 신뢰할 수 있을까요?<br/>  
아마도?<br/> 
8. 수업 취소는 어떻게 할 수 있나요?<br/>  

9. 첫 수업 시작 전에 급한 일이 생겼습니다. 환불이 가능할까요?<br/>  

10. 환불 금액은 언제 입금되나요?<br/>  
몰라요<br/> 
</p>
        </div>
        <div class="tab3_content">
<p>
11. 수업 중간에 사정이 생겨 그만둘 경우에는 환불이 되나요?<br/> 
아뇨.<br/>
12. 회원탈퇴는 어떻게 하나요? <br/>
못해요.<br/> 
</p>
        </div>
    </div>
</body>
</html>