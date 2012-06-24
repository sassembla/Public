//	HYPE.documents["irofied"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "irofied_Resources";
	var documentName = "irofied";
	var documentLoaderFilename = "irofied_hype_generated_script.js";

	// find the URL for this script's absolute path and set as the resourceFolderName
	try {
		var scripts = document.getElementsByTagName('script');
		for(var i = 0; i < scripts.length; i++) {
			var scriptSrc = scripts[i].src;
			if(scriptSrc != null && scriptSrc.indexOf(documentLoaderFilename) != -1) {
				resourcesFolderName = scriptSrc.substr(0, scriptSrc.lastIndexOf("/"));
				break;
			}
		}
	} catch(err) {	}

	// Legacy support
	if (typeof window.HYPE_DocumentsToLoad == "undefined") {
		window.HYPE_DocumentsToLoad = new Array();
	}
 
	// load HYPE.js if it hasn't been loaded yet
	if(typeof HYPE_108 == "undefined") {
		if(typeof window.HYPE_108_DocumentsToLoad == "undefined") {
			window.HYPE_108_DocumentsToLoad = new Array();
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);

			var headElement = document.getElementsByTagName('head')[0];
			var scriptElement = document.createElement('script');
			scriptElement.type= 'text/javascript';
			scriptElement.src = resourcesFolderName + '/' + 'HYPE.js?hype_version=108';
			headElement.appendChild(scriptElement);
		} else {
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);
		}
		return;
	}
	
	// guard against loading multiple times
	if(HYPE.documents[documentName] != null) {
		return;
	}
	
	var hypeDoc = new HYPE_108();
	
	var attributeTransformerMapping = {b:"i",c:"i",bC:"i",d:"i",aS:"i",M:"i",e:"f",N:"i",f:"d",aT:"i",O:"i",g:"c",aU:"i",P:"i",Q:"i",aV:"i",R:"c",aW:"f",aI:"i",S:"i",T:"i",l:"d",aX:"i",aJ:"i",m:"c",n:"c",aK:"i",X:"i",aL:"i",A:"c",aZ:"i",Y:"i",B:"c",C:"c",D:"c",t:"i",E:"i",G:"c",bA:"c",a:"i",bB:"i"};

var scenes = [{initialValues:{"16":{o:"content-box",aD:{type:1,sceneOid:"12",transition:1},h:"dot.svg",x:"visible",a:317,q:"100% 100%",b:196,j:"absolute",r:"inline",c:1,z:"5",k:"div",d:1},"4":{o:"content-box",w:"",aD:{type:1,sceneOid:"10",transition:1},h:"dot.svg",x:"visible",a:433,q:"100% 100%",b:225,j:"absolute",r:"inline",c:1,z:"2",k:"div",d:1},"15":{o:"content-box",aD:{type:1,sceneOid:"6",transition:1},p:"no-repeat",x:"visible",h:"dot.svg",q:"100% 100%",b:23,j:"absolute",r:"inline",z:"4",c:1,a:42,d:1,k:"div"},"2":{o:"content-box",h:"irof.svg",x:"visible",a:223,q:"100% 100%",b:129,j:"absolute",r:"inline",c:142,z:"1",k:"div",d:142},"5":{o:"content-box",aD:{type:1,sceneOid:"14",transition:1},h:"dot.svg",x:"visible",a:186,q:"100% 100%",b:365,j:"absolute",r:"inline",c:1,z:"3",k:"div",d:1}},timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[{f:"2",t:0,d:0.36666667,i:"b",e:214,r:1,s:225,o:"4"},{f:"2",t:0,d:0.36666667,i:"a",e:423,r:1,s:433,o:"4"},{f:"2",t:0,d:1.2,i:"a",e:74,r:1,s:42,o:"15"},{f:"2",t:0,d:1.2,i:"b",e:16,r:1,s:23,o:"15"},{f:"2",t:0,d:5.6333332,i:"b",e:233,r:1,s:196,o:"16"},{f:"2",t:0,d:5.6333332,i:"a",e:343,r:1,s:317,o:"16"},{f:"2",t:0.36666667,d:0.73333335,i:"b",e:212,s:214,o:"4"},{f:"2",t:0.36666667,d:5,i:"a",e:440,s:423,o:"4"},{f:"2",t:1.1,d:4.2666669,i:"b",e:193,s:212,o:"4"},{f:"2",t:1.2,d:2.0999999,i:"a",e:102,s:74,o:"15"},{f:"2",t:1.2,d:2.0999999,i:"b",e:25,s:16,o:"15"},{f:"2",t:3.3,d:0.86666656,i:"a",e:107,s:102,o:"15"},{f:"2",t:3.3,d:2.2333333,i:"b",e:35,s:25,o:"15"},{f:"2",t:4.1666665,d:0.26666689,i:"a",e:108,s:107,o:"15"},{f:"2",t:4.4333334,d:1.0999999,i:"a",e:154,s:108,o:"15"},{f:"2",t:5.3666668,d:1.7666664,i:"b",e:178,s:193,o:"4"},{f:"2",t:5.3666668,d:1.7666664,i:"a",e:425,s:440,o:"4"},{f:"2",t:5.6333332,d:0.13333321,i:"b",e:242,s:233,o:"16"},{f:"2",t:5.6333332,d:0.13333321,i:"a",e:335,s:343,o:"16"},{f:"2",t:5.7666664,d:2.2333336,i:"b",e:307,s:242,o:"16"},{f:"2",t:5.7666664,d:2.2333336,i:"a",e:300,s:335,o:"16"}],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:8}},sceneIndex:0,onSceneKeyUpAction:{type:0},perspective:"600px",oid:"1",onSceneAnimationCompleteAction:{type:1,sceneOid:"1",transition:1},backgroundColor:"#FFFFFF",name:"Untitled Scene"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:1,onSceneKeyUpAction:{type:0},perspective:"600px",oid:"6",initialValues:{"8":{b:181,z:"1",K:"Solid",c:90,L:"Solid",d:15,aS:6,M:1,bD:"none",N:1,aT:6,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",k:"div",A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,aA:{type:1,sceneOid:"1",transition:1},F:"center",G:"#000000",aP:"pointer",w:"you got No.1",x:"visible",I:"Solid",a:254,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"Untitled Scene 2"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:2,onSceneKeyUpAction:{type:0},perspective:"600px",oid:"10",initialValues:{"9":{b:181,z:"1",K:"Solid",c:90,L:"Solid",d:15,aS:6,M:1,bD:"none",N:1,aT:6,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",k:"div",A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,aA:{type:1,sceneOid:"1",transition:1},F:"center",G:"#000000",aP:"pointer",w:"you got No.2",x:"visible",I:"Solid",a:254,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"Untitled Scene 2 Copy"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:3,onSceneKeyUpAction:{type:0},perspective:"600px",oid:"12",initialValues:{"11":{b:181,z:"1",K:"Solid",c:90,L:"Solid",d:15,aS:6,M:1,bD:"none",N:1,aT:6,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",k:"div",A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,aA:{type:1,sceneOid:"1",transition:1},F:"center",G:"#000000",aP:"pointer",w:"you got No.3",x:"visible",I:"Solid",a:254,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"Untitled Scene 2 Copy 2"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:4,onSceneKeyUpAction:{type:0},perspective:"600px",oid:"14",initialValues:{"13":{b:181,z:"1",K:"Solid",c:90,L:"Solid",d:15,aS:6,M:1,bD:"none",N:1,aT:6,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",k:"div",A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,aA:{type:1,sceneOid:"1",transition:1},F:"center",G:"#000000",aP:"pointer",w:"you got No.4",x:"visible",I:"Solid",a:254,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"Untitled Scene 2 Copy 3"}];


	
	var javascripts = [];


	
	var Custom = {};
	var javascriptMapping = {};
	for(var i = 0; i < javascripts.length; i++) {
		try {
			javascriptMapping[javascripts[i].identifier] = javascripts[i].name;
			eval("Custom." + javascripts[i].name + " = " + javascripts[i].source);
		} catch (e) {
			hypeDoc.log(e);
			Custom[javascripts[i].name] = (function () {});
		}
	}
	
	hypeDoc.setAttributeTransformerMapping(attributeTransformerMapping);
	hypeDoc.setScenes(scenes);
	hypeDoc.setJavascriptMapping(javascriptMapping);
	hypeDoc.Custom = Custom;
	hypeDoc.setCurrentSceneIndex(0);
	hypeDoc.setMainContentContainerID("irofied_hype_container");
	hypeDoc.setResourcesFolderName(resourcesFolderName);
	hypeDoc.setShowHypeBuiltWatermark(1);
	hypeDoc.setShowLoadingPage(false);
	hypeDoc.setDrawSceneBackgrounds(true);
	hypeDoc.setDocumentName(documentName);

	HYPE.documents[documentName] = hypeDoc.API;

	hypeDoc.documentLoad(this.body);
}());

