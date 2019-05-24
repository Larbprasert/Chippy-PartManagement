<!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Modal Desc -->
	<div id="certUploadModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-upload"></i> Upload Certificate
					</h4>
				</div>


<!-- 				<form class="form-horizontal" id="form"   -->
<!-- 					method="post" command="userProfile" data-toggle="validator" -->
<!-- 					novalidate="true"> -->
 
	
				<div class="box-body">
						 
						  <div class="row ">
								<div class="col-lg-12"   >

				
						    		<form id="fileupload" action="#" method="POST" enctype="multipart/form-data">
									         <div class="row fileupload-buttonbar">
									            <div class="col-lg-8"> 
									                <span class="btn btn-success fileinput-button">
									                    <i class="glyphicon glyphicon-plus"></i>
									                    <span>Add files...</span>
									                    <input type="file" name="files[]" multiple id="cert-file">
									                </span>
									                <button type="button" class="btn btn-primary start" >
									                    <i class="glyphicon glyphicon-upload"></i>
									                    <span>Start upload</span>
									                </button>
									                <button type="reset" class="btn btn-warning cancel">
									                    <i class="glyphicon glyphicon-ban-circle"></i>
									                    <span>Cancel upload</span>
									                </button>
									                <button type="button" class="btn btn-danger delete">
									                    <i class="glyphicon glyphicon-trash"></i>
									                    <span>Delete</span>
									                </button>
									                <input type="checkbox" class="toggle minimal"> Select All
									                
									                <span class="fileupload-process"></span>
									            </div>
									            <div class="col-lg-4 fileupload-progress fade">
									                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
									                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
									                </div>
									                <div class="progress-extended">&nbsp;</div>
									            </div>
									        </div>
									        
									        <table role="presentation" class="table table-striped table-bordered">
									        	<thead class="bg-green color-palette">
													<tr>
														<th class="text-center">Name</th>
														<th class="text-center" width="20%">Description</th>
<!-- 														<th class="text-center" width="20%">Progress</th> -->
														<th class="text-center" width="20%">Action</th>
													</tr>
												</thead>
									        	<tbody class="files cert-file"></tbody>
									        </table>
									        
									    </form>


								</div> 
							</div> 

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default "
							data-dismiss="modal">
							<i class="fa fa-times-circle"></i> Close
						</button>

					</div>

<!-- 				</form> -->
				
				
			</div>
		</div>
	</div>
	

	


<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        
        <td >
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td  class="text-center">
            <p class="size">Processing...</p>                
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td  class="text-center" >
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <!-- <td class="text-center">
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td> -->

        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>

        <td  class="text-center">
            <span class="size">{%=file.size%}</span>
        </td> 

        <td  class="text-center" >
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
	
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="${cPath}/resources/jFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jFileupload/js/tmpl.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/load-image.all.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/canvas-to-blob.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/jquery.blueimp-gallery.min.js"></script>
 
<script src="${cPath}/resources/jFileupload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="${cPath}/resources/jFileupload/js/she_upload.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
	
	
	