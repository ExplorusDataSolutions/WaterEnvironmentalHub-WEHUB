/**
 * @author rahul
 */
// Browser Detection Javascript
// copyright 1 February 2003, by Stephen Chapman, Felgall Pty Ltd

// You have permission to copy and use this javascript provided that
// the content of the script is not changed in any way.

function browserCheck() {
	var agt=navigator.userAgent.toLowerCase();
	if (agt.indexOf("opera") != -1) return 'Opera';
	if (agt.indexOf("staroffice") != -1) return 'Star Office';
	if (agt.indexOf("webtv") != -1) return 'WebTV';
	if (agt.indexOf("beonex") != -1) return 'Beonex';
	if (agt.indexOf("chimera") != -1) return 'Chimera';
	if (agt.indexOf("netpositive") != -1) return 'NetPositive';
	if (agt.indexOf("phoenix") != -1) return 'Phoenix';
	if (agt.indexOf("firefox") != -1) return 'Firefox';
	if (agt.indexOf("chrome") != -1) return 'Chrome';
	if (agt.indexOf("safari") != -1) return 'Safari';
	if (agt.indexOf("skipstone") != -1) return 'SkipStone';
	if (agt.indexOf("msie") != -1) return 'Internet Explorer';
	if (agt.indexOf("netscape") != -1) return 'Netscape';
	if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla';
	if (agt.indexOf('\/') != -1) {
	if (agt.substr(0,agt.indexOf('\/')) != 'mozilla') {
	return navigator.userAgent.substr(0,agt.indexOf('\/'));}
	else return 'Netscape';} else if (agt.indexOf(' ') != -1)
	return navigator.userAgent.substr(0,agt.indexOf(' '));
	else return navigator.userAgent;
}
/** Browser height settings */
function teseraScreenSettings(){
	var browserName = browserCheck();
	var divElement	= document.getElementById('content-body');
	if(divElement) {
		var myWidth = 0, myHeight = 0;
		if( typeof( window.innerWidth ) == 'number' ) {
			//Non-IE
			myWidth = window.innerWidth;
			myHeight = window.innerHeight;
			if(browserName == 'Safari'){
				divElement.style.minHeight = (myHeight-234)+'px';
			}else if(browserName == 'Opera'){
				divElement.style.minHeight = (myHeight-235)+'px';
			}else{
				divElement.style.minHeight = (myHeight-235)+'px';
			}
		}else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
			//IE 6+ in 'standards compliant mode'
			  myWidth = document.documentElement.clientWidth;
			  myHeight = document.documentElement.clientHeight;	

			  if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)){
				 var ieversion=new Number(RegExp.$1) // capture x.x portion and store as a number
				 
				 if (ieversion>=8){
				  	divElement.style.minHeight = (myHeight-118)+'px';
				 }
				 else if (ieversion>=7){
				  	divElement.style.minHeight = (myHeight-109)+'px';
				 }
				 else if (ieversion>=6){
				  	divElement.style.height 	= (myHeight-109)+'px';
				}	
			}		  		  	
		} 
	}
}