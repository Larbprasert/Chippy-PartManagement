<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">


<%@ include file="she-navbar.jsp"%>
<%@ include file="she-sidebar.jsp"%>

<style>

.content-wrapper {
/* 	background: #f1f4f7; */
/* 	padding-top: 50px; */
/* 	margin-top: 0; */
/* 	color: #5f6468; */
/* 	height: 100%; */
/* 	width: 100%; */
 	background-image: url(${cPath}/resources/images/tp/Home_logo.png);  
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 50%;
	background-attachment: fixed; 
}


</style>

	
	
<div class="content-wrapper">


	<section class="content-header">
		<h1>
			<i class="fa fa-bell-o"></i> Update Detail
		</h1>
	</section>
	
 <section class="content">
		<div class="row">	
		
		<div class="col-md-12">
		
			<div class="row"> 
			
		         	 <div class="col-lg-12"> 
		         <div class="box box-info"> 
		       <div class="box-header with-border"> 
		        <h3 class="box-title"><i class="fa fa-lightbulb-o"></i> Version 1.4 </h3> 
		       </div> 
		       <div class="box-body"> 
			          <li>Course Training - Search (New Menu) : เลือก Course Code และ เลือก Company จากนั้น Click Search ให้โชว์เป็นรายชื่อได้เลย  </li> 
			          <li>Training Summary Report : สามารถเลือกเงื่อนไขการ Search ตาม ช่วงวัน เดือน ปี ที่ได้รับการอบรม, บริษัท, หลักสูตร </li> 
			          <li>Training Summary Report : แสดงให้เห็นว่า แต่ละหลักสูตร มีคนอบรมไปแล้วกี่ % แบ่งเป็นแต่ละบริษัท บริษัทละกี่%            </li> 
			        </ul> 
			       </div> 
			      </div> 
			     </div> 
			     
		         	 <div class="col-lg-12"> 
		         <div class="box box-info"> 
		       <div class="box-header with-border"> 
		        <h3 class="box-title"><i class="fa fa-lightbulb-o"></i> Version 1.3 </h3> 
		       </div> 
		       <div class="box-body"> 
			          <li>Add/Edit Contractor : ลบ Work Start Date ออกไป จากนั้นกด  Save พบว่า Work Start Date (01/01/1900) ยังอยู่</li> 
			          <li>Personal Training Print : Date ให้เป็นวันที่เข้ารับการอบรม ทั้ง Start Date และ End Date ไม่ใช่วันที่สั่ง Print </li> 
			          <li>Personal Training : แก้ไข Click แล้วTraining History ไม่โชว์ </li> 
			          <li>Personal Training : เปลื่ยนหัวเรื่อง  Training Document เป็น Personal Document  </li> 
			        </ul> 
			       </div> 
			      </div> 
			     </div> 
			     
			     	 <div class="col-lg-12"> 
		         <div class="box box-info"> 
		       <div class="box-header with-border"> 
		        <h3 class="box-title"><i class="fa fa-lightbulb-o"></i> Version 1.2 </h3> 
		       </div> 
		       <div class="box-body"> 
			          <li>Report Menu : Add History/Report Menu.</li> 
			          <li>Course Training : แก้ไขให้สามารถ Search ชื่อ ผู้รับเหมาได้ </li> 
			          <li>Personal Training : แก้ไข  Click Print แล้วขึ้น Error </li> 
			          <li>Personal Training : Set ช่อง Mobile , Office Phone,Email และ  Work Start Date เป็นแบบไม่บังคับใส่ข้อมูล ก็สามารถ Save ได้ </li> 
			        </ul> 
			       </div> 
			      </div> 
			     </div> 
			     
			 
		        <div class="col-lg-12"> 
		         <div class="box box-info"> 
		       <div class="box-header with-border"> 
		        <h3 class="box-title"><i class="fa  fa-lightbulb-o"></i> Version 1.1 </h3> 
		       </div> 
		       <div class="box-body"> 
			         <li>View Profile : Fix Company Not Show.</li> 
<!-- 			         <li>Report Menu : Add History/Report Menu.</li>  -->
			         <li>Personal Training : Search by company  เลือก แพทย์ และ พยาบาล  ให้แพทย์ มาอยู่ company แพทย์ , ให้พยาบาลมาอยู่ Company พยาบาล.</li> 
			         <li>Course Training : เพิ่ม Company เพื่อเป็นเงื่อนไขในการ  Search </li> 
			         <li>Course Training : Modify Course Code to Drop down </li> 
			         <li>Course Training (Edit) : Fix cannot upload file </li> 
			         <li>Course Training (Edit) : Course date เพิ่มช่วงวันอบรม จากวัน.... ถึงวัน.... เพื่อใช้ในกรณีหลักสูตรนั้นอบรมมากกว่า 1 วัน
</li> 
			        </ul> 
			       </div> 
			      </div> 
			     </div> 
			     
			        <div class="col-lg-12"> 
		         <div class="box box-info"> 
		       <div class="box-header with-border"> 
		        <h3 class="box-title"><i class="fa fa-lightbulb-o"></i> Version 1.0 </h3> 
		       </div> 
		       <div class="box-body"> 
			         <li>Start Project SHE Web Application.</li> 
			         <li>Setup User & Role.</li> 
			         <li>Import Course, Position, Organization.</li> 
			         <li>Import Contractor Data.</li> 
			         <li>Theme Celulean for SHEPortal.</li> 
			        </ul> 
			       </div> 
			      </div> 
			     </div> 
			     
			     
	    </div>
		
		</div>
		
		</div>
		</section>
		
		
	</div>
	
</body>

</html>