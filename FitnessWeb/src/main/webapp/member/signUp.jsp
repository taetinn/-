<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp"/>
</head>
<body>
   		<jsp:include page="../include/nav.jsp"/>


   <!-- Form -->
   <section>
      <h3>회원가입</h3>
      <form method="post" action="signupPro.jsp">
         <fieldset>
            <div class="row uniform 50%">
               <div class="6u 12u$(xsmall)">
                   <label>ID</label>
                   <input type="text" name="id" id="id" required> 
                   <span id="IdDupMsg"></span>
                   <label>Password</label>
                   <input type="password" id="pw1" name="passwd" required>
                   <label>Re-enter Password</label>
                   <input type="password" id="pw2" name="passwd2">
                   <span id=PsswdMatch></span>
                   <label>Name</label>
                   <input type="text" name="name" required>
               </div>

            </div>
            <div class="6u">
               <div class="select-wrapper">
               <label>Grade</label>
                  <select name="auth" id="category" required>
                     <option value="">- 선택 -</option>
                     <option name="lecturer" value="2">강사</option>
                     <option name="member" value="3">회원</option>
                  </select>
               </div>
            </div>
            <div class="4u 12u$(xsmall)">
            <label>GX Type</label>
               <input type="checkbox" id="Flying Yoga" name="gxType" value="yoga" >
               <label for="Flying Yoga">Flying Yoga</label>
               <input type="checkbox" id="Cross Fit" name="gxType" value="crossfit">
               <label for="Cross Fit">Cross Fit</label>
               <input type="checkbox" id="Pilates" name="gxType" value="pilates">
               <label for="Pilates">Pilates</label>
            </div>
            <div class="6u">
               <div class="select-wrapper">
                  <label>Period</label>
                  <select name="period" id="period">
                     <option value="">- 선택 -</option>
                     <option value="1month" >1month</option>
                     <option value="3month" >3months</option>
                     <option value="1year" >1year</option>
                  </select>
               </div>
            </div>
         </fieldset>

         <fieldset>
            <label>Gender</label>
            <div class="4u 12u$(xsmall)">
               <input type="radio" id="female" value = "female" name="gender">
               <label for="female">Female</label>
            </div>
            <div class="4u$ 12u$(xsmall)">
               <input type="radio" id="male" value = "male" name="gender">
               <label for="male">Male</label>
            </div>
            <div class="6u 12u$(small)">
               <label>Phone Number</label>
               <input type="text" name="phone">
               <label>Address</label>
               <input type="text" name="address">
            </div>
         </fieldset>
         <div class="12u$">
            <ul class="actions">
               <li><input type="submit" value="SignUp" class="special" /></li>
               <li><input type="reset" value="Reset" /></li>
            </ul>
         </div>
         </div>
      </form>
   </section>

   <!-- Footer -->
   <jsp:include page="../include/footer.jsp"/>
   

   <!-- Scripts -->
   <script src="../assets/jquery-3.5.1.js"></script>
   <script src="../assets/js/jquery.min.js"></script>
   <script src="../assets/js/skel.min.js"></script>
   <script src="../assets/js/util.js"></script>
   <script src="../assets/js/main.js"></script>
   
   <script>
    	$('input[name=id]').keyup(function(){
   		var id = $(this).val();
   		$.ajax({
   			url:'../IdDupCheck.jsp',
   			data:{id: id},
   			dataType:'json',
   			success: function(data){
   				//alert(typeof(data));
     			
   				if(data){
   					$('span#IdDupMsg').html('사용 불가').css('color','red');
   				}else{
   					$('span#IdDupMsg').html('사용 가능').css('color','green');
   				}
   			}
   		})
   	}); 
   	
   	$(function(){
   		$('input#pw2').keyup(function(){
   		var pw1 = $('input#pw1').val();
   		var pw2 = $(this).val();
   		
   		if(pw1!="" || pw2!=""){
	   		if(pw1 == pw2){
					$('span#PsswdMatch').html('비밀번호 일치').css('color','blue');
	   		}
	   		else{
					$('span#PsswdMatch').html('비밀번호 불일치').css('color','red');
	   		}
   		}
   	});
   		});
  
   </script>

</body>
</html>