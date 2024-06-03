<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<style>
		#wrapper-div{
			width: 1200px;
			margin: auto;
		}
		.swiper-container{
			padding: 10px;
			overflow: hidden;
		}
	</style>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<jsp:include page="common/menubar.jsp" />
	<div id="wrapper-div">
		<div class="swiper-container">
		  	<div class="swiper-wrapper"></div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	function xmlToJson(xml) {
	    // Create the return object
	    var obj = {};
	  
	    if (xml.nodeType == 1) {
	      // element
	      // do attributes
	      if (xml.attributes.length > 0) {
	        obj["@attributes"] = {};
	        for (var j = 0; j < xml.attributes.length; j++) {
	          var attribute = xml.attributes.item(j);
	          obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
	        }
	      }
	    } else if (xml.nodeType == 3) {
	      // text
	      obj = xml.nodeValue;
	    }
	  
	    // do children
	    // If all text nodes inside, get concatenated text from them.
	    var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
	      return node.nodeType === 3;
	    });
	    if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
	      obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
	        return text + node.nodeValue;
	      }, "");
	    } else if (xml.hasChildNodes()) {
	      for (var i = 0; i < xml.childNodes.length; i++) {
	        var item = xml.childNodes.item(i);
	        var nodeName = item.nodeName;
	        if (typeof obj[nodeName] == "undefined") {
	          obj[nodeName] = xmlToJson(item);
	        } else {
	          if (typeof obj[nodeName].push == "undefined") {
	            var old = obj[nodeName];
	            obj[nodeName] = [];
	            obj[nodeName].push(old);
	          }
	          obj[nodeName].push(xmlToJson(item));
	        }
	      }
	    }
	    return obj;
	  }
		
		const mySwiper = new Swiper('.swiper-container', {
		  	autoplay: { delay: 1500 },
		  	speed: 500,
		  	slidesPerView: 2
		});
		
		
		$(() => {
			$.ajax({
				url: 'https://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?display=10&pageno=1',
				type: 'get',
				success: (result) => {					
					result = xmlToJson(result);
					
					if(result != null){
						item = result.result.item;
						for(i of item){
							$('.swiper-wrapper').append('<div class="swiper-slide mt-1">'
									             +'<div class="card w-75">'
												    +'<div class="card-body">'
												      +'<h4 class="card-title">게임명 : '+i.gametitle+'</h4>'
												      +'<p class="card-text">회사명 : '+ i.entname +'</p>'
												      +'<p class="card-text">장르 :'+ i.genre +'</a>'
												      +'<p class="card-text">이용 연령 : '+ i.givenrate +'</a>'
												      +'<p class="card-text">요약 : ' + i.summary + '</a>'
												      +'<p class="card-text">플랫폼 : ' + i.platform + '</a>'
												      +'<p class="card-text">출시일 : ' + i.rateddate + '</a>'
												    +'</div>'
												  +'</div>'
												+'</div>');
						}
					}
					
				}
				
			});
			
		});
		
	</script>
</body>
</html>