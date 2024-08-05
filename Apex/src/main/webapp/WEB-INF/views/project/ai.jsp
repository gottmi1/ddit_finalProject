<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">Ai</h4>
        </div>
    </div>
</div>
    
	<!-- chat area -->
<div class="col-xxl-12 col-xl-12 mt-1">
	<div class="card">
		<div class="card-body px-0 pb-0">
			<ul class="conversation-list px-3" id="geminiTarget" data-simplebar
				style="min-height: 500px; overflow-y : auto; ">
			</ul>
		</div>
		<!-- end card-body -->
		<div class="card-body p-0">
			<div class="row">
				<div class="col">
					<div class="mt-2 bg-light p-3">
						<form class="needs-validation" novalidate="" name=""
							id="gemini-form">
							<div class="row">
								<div class="col mb-2 mb-sm-0">
									<input type="text" class="form-control border-0"
										placeholder="Ai에게 질문하세요!" required="" id="gemini-question">
								</div>
								<div class="col-sm-auto">
									<div class="btn-group">
										<div class="d-grid">
											<button type="submit" class="btn btn-success chat-send">
												<i class='uil uil-message'></i>
											</button>
										</div>
									</div>
								</div>
								<!-- end col -->
							</div>
							<!-- end row-->
						</form>
					</div>
				</div>
				<!-- end col-->
			</div>
			<!-- end row -->
		</div>
	</div>
	<!-- end card -->
</div>
<!-- end chat area-->
<script type="importmap">
    {
        "imports": {
            "@google/generative-ai": "https://esm.run/@google/generative-ai"
        }
    }
</script>
<script type="module">
    import { GoogleGenerativeAI } from "@google/generative-ai";

    // Fetch your API_KEY
    const API_KEY = "AIzaSyA9Vt3B-yUFfrvDJGIzOGdXLd1tDNQJ2qQ";

    // Initialize GoogleGenerativeAI
    const genAI = new GoogleGenerativeAI(API_KEY);

    // Define the model globally
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

    // Function to handle form submission
    $(function() {
        $('#gemini-form').on('submit', function(e) {
            e.preventDefault();
            let gmessage = $('#gemini-question').val();
			if(gmessage == '' || gmessage == null){
				Swal.fire({title : '메세지를 입력해 주세요.',
					icon : 'warning'});
				return false;
			}

			let html = "";

			html += "<li class='clearfix'>         ";
			html += "	<div class='conversation-text'>";
			html += "		<div class='ctext-wrap'>   ";
			html += "			<i>나</i>          ";
			html += "				<p>";
			html += gmessage
			html += "</p>      ";
			html += "		</div>                     ";
			html += "	</div>                         ";
			html += "</li>                             ";
		
			$('#geminiTarget').append(html);


            run(gmessage);
			$('#gemini-question').val('');
			
        });
    });

    // Function to generate content using the model
    async function run(gmessage) {
        const prompt = gmessage;
        const result = await model.generateContent(prompt);
        const response = await result.response;
        const text = await response.text();
        console.log(text);
		let html = "";

		html += "<li class='clearfix odd'>         ";
		html += "	<div class='conversation-text'>";
		html += "		<div class='ctext-wrap'>   ";
		html += "			<i>Gemini</i>          ";
		html += "				<p style='text-align : left'>";
		html += text.replace(/\n/g, "<br>");
		html += "</p>      ";
		html += "		</div>                     ";
		html += "	</div>                         ";
		html += "</li>                             ";
		
		$('#geminiTarget').append(html);


    }
</script>