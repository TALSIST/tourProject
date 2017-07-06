function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName, imgsrc, getLink;
	var fileLink;
	
	if(checkImageType(fullName)){ 
		imgsrc = "/story/displayImages?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/story/displayImages?fileName="+front+end;

		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	}else{
		alert("no!!");
		return;
	}
	
}