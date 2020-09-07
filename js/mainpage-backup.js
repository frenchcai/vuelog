//登录功能



    function checkLanding() {
        //$(this).button('loading').delay(1000);
        var username = $("#username").val();
        var password = $("#password").val();
        console.log(username + password);
        if (username.length == 0) {
            alert("用户名不能为空");

        } else if (password.length == 0) {
            alert("密码不能为空");
        } else if (password.length != 0 && username.length != 0) {
            $.ajax({
                "url": "/jietao/queryLanding",
                "type": "POST",
                "data": "username=" + username + "&password=" + password,
                "dataType": "json",
                "success": function (json) {
                    //console.log(json.user);
                    var user = JSON.stringify(json);
                    $.cookie('user', user, {"expires": 7, "path": '/'});
                    //console.log($.cookie('user'));
                    //alert(json.user.userID);
                    if (typeof json.user.userID != "undefined") {
                        $("#myname").text(json.user.username);
                        $("#myID").val(json.user.userID);
                        $("#nostate").hide();
                        $("#hasstate").show();
                        $("#login").hide();
                        $("#adduser").hide();


                        window.location.reload();

                    } else {
                        alert("密码或用户名错误");
                        $("#login").click();

                    }
                },
                "error": function () {
                    alert("密码或用户名错误");
                    $("#login").click();
                }


            })


        }


    };

//取消登录
function cancelLanding() {
    //$("#check").hide();
};

//跳转到注册页面
function addUser() {
    location.href = "../WEB-INF/jsp/addUser.jsp";          //location.href实现客户端页面的跳转
}

//点击登录
function toLogin() {
    $("#login").click();

}


//点赞或者取消点赞
function isLike(textID) {

    if ($("#myID").val().length != 0) {
        var user = JSON.parse($.cookie('user')).user;


        var userID = $("#textID" + textID).children().eq(0).val();
        var textID2 = $("#textID" + textID).children().eq(1).val();
        var color = $("#unionID" + textID).next().css("background-color");
        console.log(color);

        var unionID = $("#unionID" + textID).val();
        var likejson = "";
        if (typeof $.cookie("likejson") !== "undefined") {
            likejson = JSON.parse($.cookie("likejson"));
        } else {
            likejson = [];
        }


        if (color == "rgb(135, 206, 235)") {
            $.ajax({
                url: "/jietao/notLikeServlet",
                type: "POST",
                data: "userID=" + userID + "&textID=" + textID2,
                dataType: 'json',
                success: function (json) {
                    for (var i = 0; i < likejson.length; i++) {
                        // console.log(likejson[i].unionID);
                        if (likejson[i].unionID == unionID && likejson[i].username == user.username) {
                            likejson.splice(i, 1);
                        }

                    }
                    $("#unionID" + textID).next().css("background-color", "white");
                    alert("取消成功");
                    var a = JSON.stringify(likejson);
                    $.cookie("likejson", a, {expires: 365, path: '/'});
                    //console.log(a);


                },
                error: function () {
                    alert("取消失败");
                }
            })


        } else {

            $.ajax({
                url: "/jietao/isLikeServlet",
                type: "POST",
                data: "userID=" + userID + "&textID=" + textID2,
                dataType: 'json',
                success: function (json) {
                    var like = {};
                    like.unionID = unionID;
                    like.username = user.username;
                    likejson.push(like);
                    //	$.cookie('user',user, {expires: 7, path: '/' });


                    $("#blike" + textID).css("background-color", "skyblue");


                    //		$("#blike"+textID).attr("disabled",true);


                    alert("点赞成功");
                    var a = JSON.stringify(likejson);
                    $.cookie("likejson", a, {expires: 365, path: '/'});
                    console.log(a);


                },
                error: function () {
                    alert("点赞失败");
                }

            })
        }
    } else {
        alert("请登录账号");
        $("#login").click();

    }

};

//收藏
function addToMine(textID) {
    var myID = $("#myID").val();
    var userID = $("#textID" + textID).children().eq(0).val();
    var textID = $("#textID" + textID).children().eq(1).val();
    if (myID.length != 0) {
        $.ajax({
            url: "/jietao/addToMineServlet",
            type: "POST",
            data: "myID=" + myID + "&userID=" + userID + "&textID=" + textID,
            dataType: 'json',
            success: function (json) {
                alert("收藏成功");

            },
            error: function () {
                alert("收藏失败");
            }


        })
    } else {
        $("#login").click();
        alert("请登录账号");
    }

};

//留言

function sendMessage(id) {

    var userID = $("#textID" + id).children().eq(0).val();
    var textID = $("#textID" + id).children().eq(1).val();
    $("#muserID").val(userID);
    $("#mtextID").val(textID);
    queryMessage(id);

//	var userID=$("#userID").val();
//	var textID=$("#textID").val();
//	var message=$("#message").val();


    /*	$.ajax({
            url: "/jietao/sendMessageServlet",
            type: "POST",
            data: "userID="+userID+"&textID="+textID+"&message="+message,
            dataType:'json',
            success:function(json){

                confirm(json.ok+"，留言成功！");
              },


              error:function(){
                  alert("sorry,留言失败,请重试");
              }
        })
        */
}


function sendNow() {
    var myName = $("#myname").text();
    if (myName.length != 0) {
        var message = $("#message").val();
//	alert(message);
        var userID = $("#muserID").val();
        var textID = $("#mtextID").val();

        if (typeof message != null & message.length != 0) {
            $.ajax({
                url: "/jietao/sendMessageServlet",
                type: "POST",
                data: "userID=" + userID + "&textID=" + textID + "&myName=" + myName + "&message=" + message,
                dataType: "json",
                success: function (json) {
                    alert("留言成功");
                },
                error: function () {
                    alert("不能发送空信息");
                }
            })

        } else {


        }

    } else {

        alert("请先登录账号");
        $("#login").click();
    }


}


function queryMessage(id) {
    var userID = $("#textID" + id).children().eq(0).val();
    var textID = $("#textID" + id).children().eq(1).val();
    if (userID != null && textID != null) {
        $.ajax({
            url: "./queryMessageServlet",
            type: "POST",
            data: "userID=" + userID + "&textID=" + textID,
            dataType: "json",
            success: function (json) {
                $("#allmessage").empty();
                for (var i = 0; i < json.length; i++) {
                    $("#allmessage").append("<div class='modal-body'><p id=" + json[i].myName + ">用户：" + json[i].myName + "</p><p>" + json[i].message + "</p></div>");
                }


            },
            error: function () {
                $("#allmessage").empty();
                $("#allmessage").append("<div class='modal-body'><p>此文章暂时没有评论哦</p></div>");
            }


        })

    }

}


var Allcount = 0;
var allNum = 0;
var ALLPAGE = 0;

function test(textID) {
    //alert($("#"+textID+":first").text());
};
//查找文章

//跳转到对应的页数
function topage(page) {

    $("#page").empty();
    var num = $("#num").val();
    query(page, num);
    $("#nowpage").html(page);

};

//跳转到下一页
function nextpage() {
    //console.log($("#nowpage").text());
    var nowpage = Number($("#nowpage").text());
    var nextpage = nowpage + 1;
    //console.log(ALLPAGE);
    //	var a = 160.58;
    //	var b = parseInt(a);//截取整数部分
    //	alert(b);
    //	//或者
    //	var c= Math.round(a);//四舍五入
    //	alert(c);

    //if(nextpage==parseInt(ALLPAGE)){
    //	$("#nextpage").hide();
    //}
    topage(nextpage.toString());
};

//跳转到上一页
function prepage() {
    var nowpage = Number($("#nowpage").text());

    //	if(nowpage==1){
    //		$("#prepage").hide();
    //	}else{
    topage((nowpage - 1).toString());
    //	}
};

//带参数跳转
function toJsp(page) {

    if ($("#myID").val().length != 0) {
        location.href = "./" + page + ".jsp";
    } else {
        alert("请登录账号");
        $("#login").click();
    }

};


function cleanLogin() {
    $.removeCookie('user', {path: '/'});


};

function cleanLike() {
    $.removeCookie('likejson', {path: '/'});
}


function loadMore() {


    var nowpage = Number($("#nowpage").text());
    var nextpage = nowpage + 1;
    console.log(ALLPAGE);
    //	var a = 160.58;
    //	var b = parseInt(a);//截取整数部分
    //	alert(b);
    //	//或者
    //	var c= Math.round(a);//四舍五入
    //	alert(c);

    //if(nextpage==parseInt(ALLPAGE)){
    //	$("#nextpage").hide();
    //}
    topage(nextpage.toString());

}


$(document).ready(function () {


    //	$.removeCookie('user',{ path: '/'});
    //	$.removeCookie('likejson',{ path: '/'});


    //		$.removeCookie('likejson',{ path: '/'});


    //	alert(typeof $.cookie('likejson'));


})


// $(function () { $('.popover-hide').popover('hide');});
// $(function () { $('.popover-destroy').popover('destroy');});
// $(function () { $('.popover-toggle').popover('toggle');});
// $(function () { $(".popover-options a").popover({html : true });});


// var w= window.screen.width;
// var h= window.screen.height ;
// alert(h*0.1);
// 	 				 var w2=w;
// var h2=h*0.1;
// $("#black").attr("height",h2+"px");
// 	 				 $("div.body").css("width",w2+"px");

// 	 				 var a=h2*0.2;
// 	 				$("div.head").css("height",a+"px");

// 	 				var b1=h2*0.05;
// 	 				$("div.black").css("height",b1+"px");

// 	 				var l1=h2*0.07;
// 	 				$("div.login").css("height",l1+"px");

// 	 				var m1=h2*


// 开始写 jQuery 代码...


// 	$(".body").css("height",h+"px");
// 	$(".body").css("width",w+"px");
// $("div.head").css("height",b*0.3);
// $("div.head").css("width",a*0.3);

function SearchText() {
    var searchcondition = $("#searchfactorselect option:selected").val();
    // alert(searchcondition);
    var searchfactor = $("#searchfactor").val();
    if (searchfactor.length != 0) {
        //	 alert("开始");
        $.ajax({
            url: "./searchTextServlet",
            type: "POST",
            data: "condition=" + searchcondition + "&searchfactor=" + searchfactor,
            dataType: "json",
            success: function (json) {
                if (json.length > 0) {
                    $("#shareText2").empty();
                    $("#shareText").hide();
                    $(".next").hide();
                    $("#shareText2").show();
                    // console.log(json);
                    //	var count=json[0].count
                    var picpath1 = '';
                    var picpath2 = '';
                    //	 $("#shareText").empty();
                    //如果只有加载更多这个按钮，无需把之前的记录情况，考虑到用户是刷屏浏览查看文章，所以，我们直接在后面加元素即可
                    //	$("#info").append("<tr><th>姓名</th><th>性别</th><th>密码</th><th>学院</th><th>班级</th><th>电话</th></tr>");


                    for (var i = 0; i < json.length; i++) {
                        //	 console.log(json);
                        picpath1 = json[i].picpath1;
                        picpath2 = json[i].picpath2;
                        //	  alert(picpath2.length);
                        if (picpath1.length != 0 && picpath2.length != 0) {
                            $("#shareText2").append("<div id=textID" + i + " class='col-sm-12 col-md-6 clo-lg-6'><input type=hidden value=" + json[i].userID + " />" + "<input type=hidden value=" + json[i].textID + " />" + "<div class=thumbnail><div class='box box-element'><img src=./images/" + json[i].username + "/" + picpath1 + "	/><img src=./images/" + json[i].username + "/" + picpath2 + " /></div>" + "<div class='caption'><h4>" + json[i].title + "</h4><h4>" + json[i].username + "</h4><p>" + json[i].text + "</p><p>" + "<input id=unionID" + i + " type=hidden value=" + json[i].userID + json[i].textID + " />" + "<a role=button onclick=isLike(" + i + ") id=blike" + i + ">点赞" + json[i].num_like + "</a><a role=button onclick=addToMine(" + i + ") id=btome" + i + ">收藏</a><a role=button onclick=sendMessage(" + i + ") data-toggle='modal' data-target='#myModal'>留言" + json[i].num_message + "</a></p></div></div></div>");
                            $("#shareText2 img").css({"width": "48%", "float": "left", "margin-left": "1%"});

                            //children("p.1").css({"color":"red","border":"2px solid red"});
                        } else if (picpath2.length == 0) {
                            //	alert(json[i].textID);
                            $("#shareText2").append("<div id=textID" + i + "class='col-sm-12 col-md-6 clo-lg-6'><input type=hidden value=" + json[i].userID + " />" + "<input type=hidden value=" + json[i].textID + " / >" + "<div class=thumbnail><div class='box box-element'><img src=./images/" + json[i].username + "/" + picpath1 + "	/></div>" + "<div class='caption'><h4>" + json[i].title + "</h4><h4>" + json[i].username + "</h4><p>" + json[i].text + "</p><p>" + "<input id=unionID" + i + " type=hidden value=" + json[i].userID + json[i].textID + " />" + "<a role=button onclick=isLike(" + i + ") id=blike" + i + ">点赞</a><a role=button onclick=addToMine(" + i + ") id=btome" + i + ">收藏</a><a role=button onclick=sendMessage(" + i + ") data-toggle='modal' data-target='#myModal'>留言" + json[i].num_message + "</a></p></div></div></div>");
                            //	$("#shareText img").css("margin-bottom","5%");
                            $("img").addClass("img-fluid");


                        } else {
                            //	alert("第一种图片为空");
                            $("#shareText2").append("<div id=textID" + i + " class='col-sm-12 col-md-6 clo-lg-6'><input type=hidden value=" + json[i].userID + " />" + "<input type=hidden value=" + json[i].textID + " />" + "<div class=thumbnail><div class='box box-element'><img src=./images/" + json[i].username + "/" + picpath2 + "	/></div>" + "<div class='caption'><h4>" + json[i].title + "</h4><h4>" + json[i].username + "</h4><p>" + json[i].text + "</p><p>" + "<input id=unionID" + i + " type=hidden value=" + json[i].userID + json[i].textID + " />" + "<a role=button onclick=isLike(" + i + ") id=blike" + i + ">点赞</a><a role=button onclick=addToMine(" + i + ") id=btome" + i + ">收藏</a><a role=button onclick=sendMessage(" + i + ") data-toggle='modal' data-target='#myModal'>留言" + json[i].num_message + "</a></p></div></div></div>");
                            //	$("#shareText img").css("margin-bottom","5%");

                        }

                        //$("#shareText>div").addClass("col-sm-12 col-md-6 clo-lg-6");


                    }
                    $("#shareText2 a").addClass("btn btn-default");
                    //是按钮有浮动，消除高度塌陷
                    $("#shareText2 a").css("float", "right");
                    $("#shareText2").append("<div class='panel panel-success' id=success ><div class='panel-body'><h1><a onclick=backToAll()>返回</a></h1></div></div>")


                } else {
                    alert("没有找到匹配的文章");
                }

            },
            error: function () {
                alert("没有找到匹配的文章");
            }


        })


    } else {

        alert("查询内容不能为空");
    }


}

function backToAll() {
    $("#shareText2").hide();
    $("#shareText").show();
    $(".next").show();
}

