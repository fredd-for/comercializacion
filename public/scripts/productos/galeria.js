$(document).ready(function (){
	
// $("#file_1").fileinput({
//         uploadUrl: '#', // you must set a valid URL here else you will get an error
//         allowedFileExtensions : ['jpg', 'png','gif'],
//         overwriteInitial: false,
//         maxFileSize: 1000,
//         maxFilesNum: 10,
//         //allowedFileTypes: ['image', 'video', 'flash'],
//         slugCallback: function(filename) {
//             return filename.replace('(', '_').replace(']', '_');
//         }
// 	});

$("#file-1").fileinput({
		// showUpload: false,
		// showCaption: false,
		allowedFileExtensions : ['jpg', 'png','gif'],
		maxFileSize: 1000,
		// browseClass: "btn btn-primary btn-lg",
		// fileType: "any",
  //       previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
});

// $("#file-1").fileinput({
//         uploadUrl: '#', // you must set a valid URL here else you will get an error
//         allowedFileExtensions : ['jpg', 'png','gif'],
//         overwriteInitial: false,
//         maxFileSize: 1000,
//         maxFilesNum: 10,
//         //allowedFileTypes: ['image', 'video', 'flash'],
//         slugCallback: function(filename) {
//             return filename.replace('(', '_').replace(']', '_');
//         }
//     });


})