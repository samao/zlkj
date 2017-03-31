fl.outputPanel.clear();
fl.outputPanel.trace('*****Start!!!*****');
var JSFL_PATH = fl.scriptURI.substr(0, fl.scriptURI.lastIndexOf("/") + 1);
fl.outputPanel.trace('项目文件路径：'+JSFL_PATH);
function createSwf(floder) {
	var fl_floder = JSFL_PATH + floder + '/';
	fl.outputPanel.trace('源文件路径: ' + fl_floder);
	var list = FLfile.listFolder(fl_floder + '*.fla', 'files');
	for (var i = 0; i < list.length; ++i) {
		var flaName = list[i];
		var setOutUrl = fl.exportPublishProfileString(fl_floder + flaName).match(/\<flashFileName\>(.+)\<\/flashFileName\>/)[1];
		fl.outputPanel.trace(fl_floder + flaName + ' --> ' + JSFL_PATH + setOutUrl.substr(3));
		fl.openDocument(fl_floder + flaName);
		fl.getDocumentDOM().exportSWF(JSFL_PATH + setOutUrl.substr(3), true);
		fl.closeDocument(fl.getDocumentDOM(), true);
	}
}

if (!null) {
	'3'.split('').forEach(function(e){
		createSwf('class_'+e);
	})
	fl.outputPanel.trace('*****End!!!*****');
}