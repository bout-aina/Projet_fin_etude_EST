<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Folder Library concept</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
</head>
<body>



<section id="wrapper">
  
  <div class="main">
    <h1>Dossiers </h1>
  <form action="search.php" method="POST"> <div class="input-wrap"><input id="searchbar" name="search" type="text" placeholder="Search a file..." /><i class="fa fa-search" aria-hidden="true"></i></div>
    </form>
      <?php include("affDossier.php"); ?>
 
   
  </div>
   
  
 
 
  
  
    <div class="close-folder-content"><i class="fa fa-times" aria-hidden="true"></i></div>
  
  
  
  <div class="top-droppable folder-content easeout2 closed" id="folder5-content">
    <div class="close-folder-content"><i class="fa fa-times" aria-hidden="true"></i></div>
    <h2><i class="fa fa-folder" aria-hidden="true"></i><span>Folder 5</span></h2>
  </div>
  <div class="right">
    <div class="input-select-wrap">
      <div class="fileUpload">
        <span>+</span><p>Nouveau dossier</p>
      </div>
      <input id='fileSelect' multiple name='fileSelect' type='submit'>
    </div>
    
    <div id='result'></div>
  </div>
  
</section>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:300,400,700);header,nav ul,nav ul li{width:100%}
.input-wrap i,header .logo{transform:translateY(-50%)}
#searchbar,body,h1,h2,h3{font-family:Montserrat,sans-serif}
*{margin:0;padding:0;outline:0;list-style:none;text-decoration:none;box-sizing:border-box;color:#111;background:0 0;border:none}
#searchbar,.right{border-radius:8px}
body{background:url(http://www.thomaspodgro.com/pen/hero-bg.jpg) top left no-repeat;background-size:cover;font-weight:400;min-height:100vh}
#wrapper{padding:100px 100px 50px 50px}
h1,h2,h3{font-weight:300}
header .logo,header ul li{display:inline-block;font-weight:700}
header{position:fixed;top:0;left:0;background:#fff;height:100px;line-height:100px;padding:0 100px;z-index:999}
header .logo{float:left;font-size:20px;color:#fff;background:#f95536;line-height:initial;position:relative;top:50%;padding:10px}
header ul{float:right;display:inline-block}
header ul li{float:left;text-transform:uppercase;font-size:14px;color:#333;margin-left:40px;letter-spacing:1px}
.folder p,h1{font-weight:300}
header ul li.active{color:#f95536}
nav{position:fixed;top:100px;left:0;height:calc(100vh - 100px);width:100px;z-index:3;background:rgba(0,0,0,.7)}
.input-wrap,.left,.right,nav ul{position:relative}
nav ul li{height:120px;border-bottom:1px solid rgba(255,255,255,.3);text-align:center;line-height:120px;cursor:pointer}
nav ul li.active{border-bottom:none;background:#f95536}
nav ul li.disabled:hover{background:rgba(0,0,0,.2);cursor:not-allowed}
nav ul li i.fa{color:#fff;font-size:30px}
#searchbar,.input-wrap i{background:#fff;color:#333}
.main{width:60%;float:left;margin-left:100px;margin-top:50px}
.left{margin-top:30px}
.right{width:25%;float:right;background:#fff;padding:30px;height:70vh;min-height:500px;margin-top:50px;margin-bottom:10vh}
.left:after,.right:after{content:"";display:table;clear:both}
h1{font-size:50px;margin-bottom:30px}
.input-wrap i{position:absolute;right:40px;top:50%}
.folder,.item{margin-right:10px;position:relative}
#searchbar{display:block;width:100%;padding:20px 40px;font-size:18px}
#searchbar::-webkit-input-placeholder{color:#b9b9b9}
#searchbar::-moz-placeholder{color:#b9b9b9}
#searchbar:-ms-input-placeholder{color:#b9b9b9}
#searchbar:-moz-placeholder{color:#b9b9b9}
.item{cursor:-webkit-grab;margin-bottom:20px;padding:0 0 20px 20px;display:block;border-bottom:1px solid #ccc;background:rgba(255,255,255,.3);transition:.3s width ease-out,.3s height ease-out}
.item i{margin-right:10px}
.item i,.item p{display:inline-block;vertical-align:middle}
.item p{line-height:1.2;word-break:break-all;width:calc(100% - 50px)}
.is-dropped{transform:scale(0);transition:.2s all ease-out}
.folder{float:left;width:150px;height:150px;background:rgba(0,0,0,0);transition:.2s background-color ease-out;text-align:center}
.folder i.fa-folder{height:90px!important;width:100%!important;line-height:100px!important;margin:10px auto!important;font-size:90px!important;transition:.2s all ease-out}
.folder i.fa-check{color:#fff;background:rgba(0,0,0,.1);border-radius:50%;width:60px;height:60px;text-align:center;line-height:60px;position:absolute;left:0;right:0;top:34px;margin:auto;pointer-events:none;transform:scale(0);opacity:0;font-size:24px}
.folder.item-dropped i.fa-check{animation:animateValidation 1s linear}
@keyframes animateValidation{
0%{transform:scale(1.5);opacity:0}
40%,80%{transform:scale(1);opacity:1}
100%{transform:scale(0);opacity:0}
}
.folder p{cursor:default;opacity:.5;transition:.2s all ease-out}
.folder:hover .fa-folder{transform:scale(1.1)!important}
.folder:hover p{transform:translateY(6px);opacity:1}
.tooltiper .tooltip,.tooltiper-up .tooltip{font-size:.7rem;background:rgba(0,0,0,.7);padding:5px 10px;border-radius:5px;line-height:1.4em;opacity:0}
#folder1 i.fa-folder,#folder1-content h2 .fa-folder{color:#eb4141!important}
#folder2 i.fa-folder,#folder2-content h2 .fa-folder{color:#4bc97a}
#folder3 i.fa-folder,#folder3-content h2 .fa-folder{color:#6fdbeb}
#folder4 i.fa-folder,#folder4-content h2 .fa-folder{color:#eeca4e}
#folder5 i.fa-folder,#folder5-content h2 .fa-folder{color:#5b5b5b}
.tooltiper{position:relative;z-index:3}
.tooltiper .tooltip{min-width:110px;position:absolute;text-align:left;color:#fff;display:block;top:50%;left:120px;transform:translateY(-50%) scale(0);transform-origin:left;transition:transform .2s ease-out,opacity .1s ease-out .1s}
.tooltiper-up .tooltip{min-width:0;position:absolute;text-align:center;color:#fff;display:inline-block;top:-20px;left:50%;transform:translate(-50%,-50%) scale(0);transform-origin:bottom}
.tooltiper-up:hover .tooltip,.tooltiper:hover .tooltip{opacity:1;transition:transform .2s ease-out,opacity .1s ease-out}
.tooltiper:hover .tooltip{transform:translateY(-50%) scale(1)}
.tooltiper-up:hover .tooltip{transform:translate(-50%,-50%) scale(1)}
.tooltiper .tooltip:after{right:100%;top:50%;border:solid transparent;content:" ";height:0;width:0;position:absolute;pointer-events:none;border-right-color:rgba(0,0,0,.7);border-width:4px;margin-top:-4px}
.tooltiper-up .tooltip:after{border-width:7px 7px 0;border-color:rgba(0,0,0,.7) transparent transparent;right:0;left:0;margin:0 auto;top:100%}
.folder-content{display:none;position:absolute;height:420px;width:1012px;background:rgba(255,255,255,.9);z-index:10;box-shadow:0 10px 30px rgba(0,0,0,.1);left:150px;top:315px;border-radius:8px;padding:30px}
.folder-content h2{font-size:21px;padding-bottom:10px;margin-bottom:30px;border-bottom:1px solid #ccc;cursor:default}
.folder-content h2 i{margin-right:10px}
.easeout2{transition:.2s all ease-out}
.folder-content.closed{transform:scale(.8);opacity:0}
.close-folder-content{position:absolute;right:20px;top:20px;background:#f3f3f3;padding:5px 10px;border-radius:5px}
.close-folder-content:hover,.fileUpload span{background:#f95536}
.close-folder-content,.close-folder-content i{transition:.16s all ease-out}
.close-folder-content:hover i{color:#fff}
.folder-content .file{float:left;margin-right:20px;bottom:20px;text-align:center;padding:20px}
.folder-content p{font-size:14px}
.folder-content .file i{font-size:36px;margin-bottom:15px}
.ui-draggable-dragging{z-index:999}
.input-select-wrap{position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);width:250px;height:70px;line-height:70px;margin:0 auto;text-align:center;transition:.3s all ease-out}
#fileSelect{color:transparent;position:relative;width:100%;height:100%;margin:0 auto;display:block;cursor:pointer}
.fileUpload p,.fileUpload span{display:inline-block;vertical-align:middle;transition:.3s all ease-out}
#fileSelect::-webkit-file-upload-button{visibility:hidden}
.fileUpload{position:absolute;top:0;left:0;width:100%;height:100%}
.fileUpload span{opacity:.8;height:40px;width:40px;line-height:40px;color:#fff;text-align:center;border-radius:50%;font-size:24px;margin-right:10px}
.fileUpload p{font-weight:400;line-height:30px;height:30px;font-size:18px}
.fileUpload p:after{content:"Add up to 5GB";display:block;height:0;font-weight:400;text-align:left;color:#999;line-height:10px;font-size:14px;margin-top:5px;opacity:0;transition:.3s all ease-out;transform:translateY(-18px)}
#draggableFile,#draggableFile>span{position:fixed;text-align:center;width:100%}
.input-select-wrap:hover .fileUpload p:after{opacity:1;height:10px;transform:translateY(0)}
.input-select-wrap:hover .fileUpload p{height:50px}
.input-select-wrap:hover .fileUpload span{opacity:1}
#draggableFile{color:#FFF;top:0;left:0;opacity:0;background:rgba(249,85,54,.7);height:0;transition:.6s opacity ease-out,0s height linear .6s;z-index:3}
.visible #draggableFile{opacity:1;height:100vh;transition:.6s opacity ease-out}
#draggableFile>span{display:block;font-size:30px;top:50%;height:0;transform:translateY(-50%);color:#fff;pointer-events:none}
#draggableFile>span>span{font-size:16px;opacity:.7;font-weight:300;color:#fff}
#myForm #result{background-color:#999;padding:10px;border-radius:10px;color:#222;margin-right:30px;margin-left:30px;border:2px solid #000;display:none}


</style>

<script>

$(document).ready(function(){

var fileSelect = document.getElementById("fileSelect"),
  draggableFile = document.getElementById("draggableFile"),
  result = document.getElementById("result"),
  wrapper = document.getElementById("wrapper");
xhr = new XMLHttpRequest();
if (window.File && window.FileList && window.FileReader) {
  function setupReader(file, handler) {
    var reader = new FileReader();
    reader.onloadend = handler;
    reader.readAsDataURL(file);
  }

  function overFile(e) {
    e.stopPropagation();
    e.preventDefault();
    wrapper.className = "visible";
  }

  function endFile(e) {
    e.stopPropagation();
    e.preventDefault();
    wrapper.className = "";
  }

  function dropFile(e) {
    e.stopPropagation();
    e.preventDefault();
    var files = e.target.files || e.dataTransfer.files;
    for (var i = 0; i < files.length; i++) {
      var eachFile = files[i],
        type = eachFile.type == "" || eachFile.type == null
          ? eachFile.name.split(".")[1]
          : eachFile.type;
      setupReader(eachFile, function(e) {
        $("#result").append('<div class="item"><i class="fa fa-file-o" aria-hidden="true"></i><p>'+eachFile.name +'</p></div>');
      });
    }
    result.style.display = "block";
    wrapper.className = "";
    $(".input-select-wrap").css({
      bottom: "30px",
      top: "inherit",
      transform: "none"
    });

    setTimeout(function() {
      $(".item").draggable({
        revert: true,
        start: function() {
          $(".folder").css({
            "background-color": "rgba(0,0,0,0.05)"
          });
          $(this).css({
            display: "inline-block"
          });
        },
        stop: function() {
          $(".folder").css({
            "background-color": "rgba(0,0,0,0)"
          });
          $(this).css({
            display: "block"
          });
        },
        drag: function(event, ui) {
          $(this).css("z-index", "999");
        }
      });
    }, 300);
  }

  if (xhr.upload) {
    wrapper.addEventListener("dragover", overFile);
    wrapper.addEventListener("dragenter", overFile);
    draggableFile.addEventListener("dragleave", endFile);
    draggableFile.addEventListener("drop", dropFile);
    fileSelect.addEventListener("change", dropFile);
  }
}

$(document).ready(function() {
  var targetFolder;
  var folderID;
  var zIndex;

  $(".folder").droppable({
    accept: ".item, .file",
    over: function(event, ui) {
      $(this).find("i.fa-file").css({
        transform: "scale(1.1)",
        opacity: "0.5"
      });
      $(this).find("p").css({
        opacity: "0.5"
      });
      $(this).css({
        background: "rgba(0,0,0,0.0)",
        border: "1px solid rgba(0,0,0,0.1)"
      });
      targetFolder = $(".ui-droppable-hover").attr("id") + "-content";
      folderID = $(".ui-droppable-hover").attr("id");
    },
    out: function(event, ui) {
      $(this).find("i.fa-file").css({
        transform: "scale(1)",
        opacity: "1"
      });
      $(this).find("p").css({
        opacity: "1"
      });
      $(this).css({
        background: "rgba(0,0,0,0.05)",
        border: "1px solid rgba(0,0,0,0)"
      });
    },
    drop: function() {
      dropItemToFolder(targetFolder, folderID);
      updateFilesNumbers();
    }
  });

  $(".left").sortable({
    revert: true
  });

  $(".folder-content").droppable({
    drop: function() {
      var eLtarget = $(this).attr("id");
      var eLFolder = $(this).attr("id").slice(0, -8);
      if (!$(".ui-draggable-dragging").hasClass(eLtarget + "-item")) {
        dropItemToFolder(eLtarget, eLFolder);
        updateFilesNumbers();
      }
    }
  });
  var eLfolderindex;
  var draggieWindow = $(".folder-content").draggabilly();
  draggieWindow.on("dragStart", function(event, pointer) {
    (zIndex = $(".folder-content")
      .map(function() {
        return $(this).css("z-index");
      })
      .get()), (currentzIndex = Math.max.apply(null, zIndex));
    $(this).css({
      display: "block",
      "z-index": currentzIndex + 1
    });
  });
  $(".folder-content").resizable({
    minWidth: 250,
    minHeight: 150,
    start: function(event, ui) {
      $(".folder-content").draggabilly("disable");
    },
    stop: function(event, ui) {
      $(".folder-content").draggabilly("enable");
    }
  });
  $(".top-droppable").topDroppable({
	    drop: function (e, ui) {
	       console.log("dropped into " + $(this).attr('id'));
	    }
	});

  $(".close-folder-content").click(function() {
    var eLfolder = $(this).parent();
    eLfolder.addClass("easeout2").addClass("closed");
    setTimeout(function() {
      eLfolder.css("display", "none");
    }, 300);
  });

  $(".folder").dblclick(function() {
    (zIndex = $(".folder-content")
      .map(function() {
        return $(this).css("z-index");
      })
      .get()), (currentzIndex = Math.max.apply(null, zIndex));

    var eLfolder = $(this).attr("id");

    $("#" + eLfolder + "-content").css({
      display: "block",
      "z-index": currentzIndex + 1
    });
    setTimeout(function() {
      $("#" + eLfolder + "-content").addClass("easeout2").removeClass("closed");
    }, 5);
    setTimeout(function() {
      $("#" + eLfolder + "-content").removeClass("easeout2");
    }, 300);
  });

  toolTiper();
});

function toolTiper() {
  $(".tooltiper").each(function() {
    var eLcontent = $(this).attr("data-tooltip"),
      eLtop = $(this).position().top,
      eLleft = $(this).position().left;
    $(this).append('<span class="tooltip">' + eLcontent + "</span>");
  });
}

function dragTheFiles() {
  setTimeout(function() {
    $(".file").draggable({
      revert: true,
      start: function() {
        $(".folder-content").draggabilly("disable");
        $(".folder").css({
          "background-color": "rgba(0,0,0,0.05)"
        });
        $(this).css({
          "background-color": "rgba(0,0,0,0.02)"
        });
      },
      stop: function() {
        $(".folder-content").draggabilly("enable");
        $(".folder").css({
          "background-color": "rgba(0,0,0,0)"
        });
        $(this).css({
          "background-color": "rgba(0,0,0,0.0)"
        });
      },
      drag: function(event, ui) {
        $(this).css({
          "z-index": "999"
        });
      }
    });
  }, 300);
}

function dropItemToFolder(target, folderid) {
  $(".ui-draggable-dragging").draggable({
    revert: false
  });
  $(".ui-draggable-dragging").addClass("is-dropped");
  $("#" + folderid).addClass("item-dropped");
  $(".folder").css({
    background: "rgba(0,0,0,0.05)",
    border: "1px solid rgba(0,0,0,0)"
  });
  $(".folder .fa-folder").css({
    transform: "scale(1)",
    opacity: "1"
  });
  $(".folder p").css({
    opacity: "1"
  });
  setTimeout(function() {
    $(".is-dropped").appendTo("#" + target);
    $(".is-dropped").removeClass().addClass(target + "-item").addClass("file");
    $("." + target + "-item").draggable("destroy");
    $("." + target + "-item").css({
      left: "0",
      top: "0"
    });
  }, 300);
  setTimeout(function() {
    $("#" + folderid).removeClass("item-dropped");
  }, 1000);
  dragTheFiles();
}


function updateFilesNumbers() {
  setTimeout(function(){
    $('.folder-content').each(function(){
      var eLFolder = $(this).attr("id").slice(0, -8);
      var filesCount = $(this).find('.file').length;
      $('#'+eLFolder).find('.tooltip').html(filesCount+' file(s)');
    });
  },300);
}
});

</script>