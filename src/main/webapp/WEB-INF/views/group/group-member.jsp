<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- content -->

    <section>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                    <div class="card mb-3">
                        <div class="card-header d-flex justify-content-between">
                            <h6>선생님</h6>
                            <a id="inviteTeacherBtn" href="" data-toggle="modal" data-target="#inviteTeacherModal"><i class="fas fa-user-plus"><!--선생님초대아이콘--></i></a>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between">
                                <div class="d-flex">
                                    <img class="rounded-circle sm-profile-img" src="https://picsum.photos/50/50" alt="">
                                    <h6>강덕영</h6>
                                </div>
                                <div class="dropdown dropleft">
                                    <a href="" class="" data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">이메일</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                        <a class="dropdown-item" href="#">수업 소유자로 지정</a>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div class="d-flex">
                                    <img class="rounded-circle sm-profile-img" src="https://picsum.photos/50/50" alt="">
                                    <h6>이재용</h6>
                                </div>
                                <div class="dropdown dropleft">
                                    <a href="" class="" data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">이메일</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                        <a class="dropdown-item" href="#">수업 소유자로 지정</a>

                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="card mb-3">
                        <div class="card-header d-flex justify-content-between">
                            <h6>학생</h6>
                            <a href="" id="inviteStudentBtn" data-toggle="modal" data-target="#inviteStudentModal"><i class="fas fa-user-plus"></i></a>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" class="mr-1" value="">
                                    <h6>전체</h6>
                                </div>
                                <div class="dropdown dropleft">
                                    <a href="" class="" data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">차단</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" class="mr-1" value="">
                                    <img class="rounded-circle sm-profile-img" src="https://picsum.photos/50/50" alt="">
                                    <h6>강덕영</h6>
                                </div>
                                <div class="dropdown dropleft">
                                    <a href="" class="" data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">이메일</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" class="mr-1" value="">
                                    <img class="rounded-circle sm-profile-img" src="https://picsum.photos/50/50" alt="">
                                    <h6>이재용</h6>
                                </div>
                                <div class="dropdown dropleft">
                                    <a href="" class="" data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">이메일</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- content -->

    <!-- The Modal -->
    <div class="modal fade" id="inviteTeacherModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">선생님 초대</h4>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-12 control-label" for="textinput">이메일 주소</label>
                        <div class="col-12 mb-2 inputDiv">
                            <input id="tcinput" name="textinput" type="text" placeholder="" class="form-control input-md"
                            onkeypress="if(event.keyCode==13){addMail('tc'); return false;}">
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="" data-dismiss="modal">취소</a>
                    <a href="#" class="invite-btn">초대하기</a>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="inviteStudentModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">학생 초대</h4>
                    </div>
    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="form-group st-group">
                            <label class="col-12 control-label" for="textinput">이메일 주소</label>
                            <div class="col-12 mb-2 inputDiv">
                                <input id="stinput" name="textinput" type="text" placeholder="" class="form-control input-md"
                                onkeypress="if(event.keyCode==13){addMail('st'); return false;}">
                            </div>
                        </div>
                    </div>
    
                    <!-- Modal footer -->
                    <!-- data-dismiss="modal text-muted" -->
                    <div class="modal-footer">
                        <a href="#" data-dismiss="modal">취소</a>
                        <a href="#" class="invite-btn">초대하기</a>
                    </div>
    
                </div>
            </div>
        </div>
    <!-- The Modal -->
    <script>
    	var mailArr = [];
    	var inviteCode = '';
    	
    	// 메일 추가 입력
        function addMail(distinct) {
        	var inputText = '';
        	if(distinct == 'st'){
    			inputText = $('#stinput').val();
    			inviteCode = '${groupVo.inviteCodeS}';
        	}else if(distinct == 'tc'){
        		inputText = $('#tcinput').val();
        		inviteCode = '${groupVo.inviteCodeM}';
        	}
    		$('.inputDiv').after($('<span class="badge badge-pill badge-secondary mailsText">'+inputText+' <i class="fas fa-times ic"></i></span>'));
    		mailArr.push(inputText);
			$('#stinput,#tcinput').val('');    		
		}
        
        // 초대 버튼 클릭시
        $('.invite-btn').on('click',function(){
        	var mailStr = mailArr.join();
        	$.ajax({
        		url : "${pageContext.request.contextPath}/group/invite/proc",
        		data : {'mails':mailStr, 'groupNum':'${groupVo.groupNum}', 'groupName':'${groupVo.groupName}', 'inviteCode':inviteCode},
        		dataType : 'json',
        		success : function(data){
        			if(data.msg == 'success'){
        				$('#inviteStudentModal').modal('hide');
        				alert('메일 전송 완료');
        				mailArr = [];
        	        	$('.mailsText').remove();
        			}
        		}
        	});
        });
        
        // 학생 초대 x버튼 클릭시 이벤트
        $(document).on('click', '.ic', function(event){
        	$(this).parent().remove();
        	var rmv = $(this).parent().text();
        	rmv = rmv.trim();
        	var idx = mailArr.indexOf(rmv);
        	mailArr.splice(idx, 1);
        	console.log(mailArr);
        });
    </script>
