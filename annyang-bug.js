var TOA_Recognition = {
	'bootUp' : function (){

		annyang.addCallback('result', function(userSaid) {
			console.log(userSaid)
		});

		annyang.addCallback('resultNoMatch', function(userSaid) {

			if(sessionStorage.speakingState=="false"){
				$("#TOA_Recognition_Window").prepend('<div class="TOA_Recognised_Speach"><strong>YOU:</strong><br />'+userSaid[0]+'</div>');
				$.post( window.location.href , 'queryAI=true&recognizedText='+userSaid[0]+'&isVoice=1&staffControl='+sessionStorage.staffControl, function( Response ){
					var Response = jQuery.parseJSON( Response );
					switch (Response.Response) {
						case 'OK':

							if(sessionStorage.staffControl!=="true"){

								if(Response.ResponseMessage){
									TOA_Synthesis.Communicate(Response.ResponseMessage);
									$("#TOA_Recognition_Window").prepend('<div class="TOA_Response_Speech"><strong>TOA:</strong><br />'+Response.ResponseMessage+'</div>');
								}
								console.log(Response.ResponseResponse)
								if(Response.ResponseAction && Response.ResponseActionIncomplete===false){

									if(Response.ResponseAction==="TOA_ECommerce.search"){

										setTimeout(function(){

											var redirect = function(url, method) {
												var form = document.createElement('form');
												form.method = method;
												form.action = url;
												var input = document.createElement('input');
												input.type = "text";
												input.name = "productSearch";
												input.value = userSaid[0];
												form.appendChild(input);
												document.body.appendChild(form);
												form.submit();
											};

											redirect('/onlinestore/search/', 'post');

										},5000);

									}else{

										setTimeout(function(){
											if(!Response.ResponseParameters){
												Response.ResponseParameters=[];
											}
											(eval(Response.ResponseAction))(Response.ResponseParameters);
										},5000);

									}

								}

							}
							break;
						default:
							TOA_Synthesis.Communicate(Response.ResponseMessage);
							break;
					}

				});
			} else {
				//console.log("Stil speaking")
			}

		});

		annyang.setLanguage('en-GB')
		annyang.start();


    },
	'pause' : function (){

		annyang.pause();

    },
	'resume' : function (){

		annyang.resume();
		sessionStorage.recognitionState=="true"

    },
	'terminate' : function (){

		annyang.abort();
		sessionStorage.recognitionState=="false"

    }
};

$('body').on('click','#vrOn',function(e){

	if (annyang) {

		if ($('#vrOn').is(':checked')) {

			TOA_Synthesis.Communicate("Voice recognition is now active");
			$('#actionResponse').text("Voice recognition is now active.");
			$('#actionResponseModal').modal('show');
			sessionStorage.recognitionState="true"

			setTimeout(function(){
				TOA_Recognition.bootUp()
			},4000);

		} else {

			annyang.abort();

			TOA_Synthesis.Communicate("Voice recognition is now disabled");
			$('#actionResponse').text("Voice recognition is now disabled.");
			$('#actionResponseModal').modal('show');
			sessionStorage.recognitionState="false"

		}

	} else {

		sessionStorage.recognitionState="false"
		TOA_Synthesis.Communicate("Sorry, my speech recognition features are not compatible with your browser. Please use Google Chrome or use the chat feature below.");
		$('#actionResponse').text("Sorry, my speech recognition features are not compatible with your browser. Please use Google Chrome or use the chat feature below.");
		$('#vrOn').attr('checked', false);
		$('#actionResponseModal').modal('show');

	}
});

$(document).ready(function(){
	if(sessionStorage.recognitionState=="true"){
		TOA_Recognition.bootUp()
		$('#vrOn').attr('checked', true);
	}
});
