/*MGSilde():图片滑动 参数:id;slideWidth滑动框宽度(可选)；
term其他条件（可选(参数类型非number)：num是固定参数，代表纯数字；term传显示文字，代表字+数字；否则为无字无数字的纯标点;）*/

function MGSilde(MGSilde,slideWidth,term){
	var wrap = $("#"+MGSilde);
	var slideWindow = wrap.find(".js_slide_window");
	var slideWidth = slideWidth ? slideWidth: slideWindow.width();
	var term = term ? term : "" ;
	//根据参数长度以及参数类型判断参数（slideWidth/term）
	var argu = arguments.length;
	if(argu>1){
	  if(typeof(arguments[1]) =="number"){
	    slideWidth = arguments[1];
		term = "";
	  }else{
	    term = arguments[1];	
		slideWidth = slideWindow.width();
	  }
	}
	var picList = wrap.find('.js_slide_pics');
	var picNumber = picList.children().length;
	var btnPrev = wrap.find(".js_slide_prev");
	var btnNext = wrap.find(".js_slide_next");
	var btns = wrap.find(".js_btns");
	var index = 0;
	var picTimer;
	picList.css("width",slideWidth*picNumber);
	btnPrev.click(function() {	
		index -= 1;
		if(index == -1) {index = picNumber - 1;}
		showPics(index);
	});
	btnNext.click(function() {	
		index += 1;
		if(index == picNumber) {index = 0;}
		showPics(index);
	});
	for(var i=0; i < picNumber; i++) {
		if(term =="num"){
		   $("<li>"+(i+1)+"</li>").appendTo(btns);
		}else if(term==term & term !=""){
		   $("<li>"+term+(i+1)+"</li>").appendTo(btns);
		}else{
		   $("<li></li>").appendTo(btns);
		}
	}
	var btnItems = btns.find("li");
	btnItems.mouseenter(function() {
		index = btnItems.index(this);
		showPics(index);
	}).eq(0).addClass("MGSilde_btnCurrent");
	slideWindow.hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			showPics(index);
			index++;
			if(index == picNumber) {index = 0;}
		},5000); 
	}).trigger("mouseleave");
	function showPics(index){
		var rollLeft = -index*slideWidth;
		picList.stop(true,false).animate({"left":rollLeft},300);
		btnItems.removeClass("MGSilde_btnCurrent").eq(index).addClass("MGSilde_btnCurrent");
	};
};

/*MGTab():标签切换 
参数:id;触发方式(mouseenter/click);
index显示标签索引（可选）;term是否同时切换两个窗口（可选）*/
function MGTab(MGTab,MGTab_method,index,term){
	var wrap = $(document.getElementById(MGTab));
	var index = index ? index : 0 ;
	var term = term ? term : false ;
	//根据参数长度以及参数类型判断参数（index/term）
	var argu = arguments.length;
	if(argu>2){
	  if(typeof(arguments[2]) =="number"){
	    index = arguments[2];
		term = false;
	  }else{
	    term = arguments[2];	
		index = 0;
	  }
	}
	var btn = wrap.find(".js_tab_btn").children();
	var tabBox = wrap.find(".js_tab_item");
	btn.eq(index).addClass("MGTab_current");
	tabBox.eq(index).addClass("MGTab_current");
	if(term){
	  var tabBox1 = wrap.find(".js_tab_item1");
	  var tabBox2 = wrap.find(".js_tab_item2");
	  tabBox2.eq(index).addClass("MGTab_current");
	}
	btn.bind(MGTab_method,function(){
		index = btn.index(this);
		btn.removeClass("MGTab_current");
		tabBox.removeClass("MGTab_current");
		if(term){
		tabBox1.removeClass("MGTab_current");
		tabBox2.removeClass("MGTab_current");
		}
		$(this).addClass("MGTab_current");
		tabBox.eq(index).addClass("MGTab_current");
		if(term){
		  tabBox1.eq(index).addClass("MGTab_current");
		  tabBox2.eq(index).addClass("MGTab_current");
		}
	});
};
/*MGTab():标签切换 
参数:id;触发方式(mouseenter/click);
index显示标签索引（可选）;term是否同时切换两个窗口（可选）*/
function MGTab2(MGTab,MGTab_method,index,term){
	var wrap = $(document.getElementById(MGTab));
	var index = index ? index : 0 ;
	var term = term ? term : false ;
	//根据参数长度以及参数类型判断参数（index/term）
	var argu = arguments.length;
	if(argu>2){
		if(typeof(arguments[2]) =="number"){
			index = arguments[2];
			term = false;
		}else{
			term = arguments[2];	
			index = 0;
		}
	}
	var btn = wrap.find(".js_tab_btn").children();
	var tabBox = wrap.find(".js_tab_item");
	btn.eq(index).addClass("MGTab_current");
	tabBox.eq(index).addClass("MGTab_current1");
	if(term){
		var tabBox1 = wrap.find(".js_tab_item1");
		var tabBox2 = wrap.find(".js_tab_item2");
		tabBox2.eq(index).addClass("MGTab_current");
	}
	btn.bind(MGTab_method,function(){
		index = btn.index(this);
		btn.removeClass("MGTab_current");
		tabBox.removeClass("MGTab_current1");
		if(term){
			tabBox1.removeClass("MGTab_current");
			tabBox2.removeClass("MGTab_current");
		}
		$(this).addClass("MGTab_current");
		tabBox.eq(index).addClass("MGTab_current1");
		if(term){
			tabBox1.eq(index).addClass("MGTab_current");
			tabBox2.eq(index).addClass("MGTab_current");
		}
	});
};
function MGTab1(MGTab,MGTab_method,index,term){
	var wrap = $(document.getElementById(MGTab));
	var index = index ? index : 0 ;
	var term = term ? term : false ;
	//根据参数长度以及参数类型判断参数（index/term）
	var argu = arguments.length;
	if(argu>2){
	  if(typeof(arguments[2]) =="number"){
	    index = arguments[2];
		term = false;
	  }else{
	    term = arguments[2];	
		index = 0;
	  }
	}
	var btn = wrap.find(".js_tab_btn").children();
	var tabBox = wrap.find(".js_tab_item");
	btn.eq(index).addClass("MGTab_current");
	tabBox.addClass("none");
	tabBox.eq(index).removeClass("none");
	if(term){
	  var tabBox1 = wrap.find(".js_tab_item1");
	  var tabBox2 = wrap.find(".js_tab_item2");
	  tabBox2.addClass("none");
	  tabBox2.eq(index).removeClass("none");
	}
	btn.bind(MGTab_method,function(){
		index = btn.index(this);
		btn.removeClass("MGTab_current");
		tabBox.addClass("none");
		$(this).addClass("MGTab_current");
		tabBox.eq(index).removeClass("none");
		if(term){
		  tabBox1.addClass("none");
		  tabBox2.addClass("none");
		  tabBox1.eq(index).removeClass("none");
		  tabBox2.eq(index).removeClass("none");
		}
	});
};

function MGTabN(MGTab,MGTab_method,index,term){
	var wrap = $(document.getElementById(MGTab));
	var index = index ? index : 0 ;
	var term = term ? term : false ;
	//根据参数长度以及参数类型判断参数（index/term）
	var argu = arguments.length;
	if(argu>2){
	  if(typeof(arguments[2]) =="number"){
	    index = arguments[2];
		term = false;
	  }else{
	    term = arguments[2];	
		index = 0;
	  }
	}
	var btn = wrap.find(".js_tab_btn").children();
	var liWidth;
	if(wrap.find(".js_tab_btn").width()==wrap.width()){
	   liWidth =(wrap.width())/btn.length;
	}else{
	   liWidth =(wrap.find(".js_tab_btn").width())/btn.length;
	}
	var tabBox = wrap.find(".js_tab_item");
	btn.css("width",liWidth);
	btn.eq(index).addClass("MGTab_current");
	tabBox.eq(index).addClass("MGTab_current");
	if(btn.is(".js_tab_btn_other")){
		btn = wrap.find(".js_tab_btn").children(":not(.js_tab_btn_other)");
	}
	if(term){
	  var tabBox1 = wrap.find(".js_tab_item1");
	  var tabBox2 = wrap.find(".js_tab_item2");
	  tabBox2.eq(index).addClass("MGTab_current");
	}
	btn.bind(MGTab_method,function(){
		index = btn.index(this);
		btn.removeClass("MGTab_current");
		tabBox.removeClass("MGTab_current");
		if(term){
		tabBox1.removeClass("MGTab_current");
		tabBox2.removeClass("MGTab_current");
		}
		$(this).addClass("MGTab_current");
		tabBox.eq(index).addClass("MGTab_current");
		if(term){
		  tabBox1.eq(index).addClass("MGTab_current");
		  tabBox2.eq(index).addClass("MGTab_current");
		}
	});
};


/*导航-产品分类*/
$(function(){
	var btn = $(".nav_classify_btn");
	var wrap = $(".nav_classify");
	var $time_1 = null;
	var $time_2 = null;
	var wShow = function(){wrap.fadeIn(200);};
	var wHide = function(){wrap.fadeOut(200);};
	var homePage = false;
	if (homePage){$(wrap).show();}
	wrap.hover(function(){
//		time_2 = setTimeout(wShow,300);
//		clearTimeout($time_1);
	});
	var subBlock = wrap.children();
	var flag = false;
	var ts;
	subBlock.hover(function(){
		ts = $(this).children("dl");
		var top = $(this).height();
		if($(this).children().hasClass("nav_classify_sub")){
			flag = true;
			$(this).find(".nav_classify_sub").show();
			ts.addClass("current");
		}
	},function(){
		if(flag){
			flag = false;
			$(this).find(".nav_classify_sub").hide();
			ts.removeClass("current");
		}
	});
});

$(function(){
	$(".nav_classify_btn").hover(function(e) {
        $(".nav_classify").toggleClass("none block");
    });
	$(".nav_classify").hover(function(e) {
        $(".nav_classify").toggleClass("none block");
    });
});


$(function(){
	$(".nav_classify_btn").hover(function(e) {
        $(".nav_classify_fx").toggleClass("none block");
    });
	$(".nav_classify_fx").hover(function(e) {
        $(".nav_classify_fx").toggleClass("none block");
    });
});

/*MGProSlide():产品滑动 参数:id;是否垂直;最小li数*/
function MGProSlide(MGProSlide,isVertical,minItem,timmer){
	var wrap = $("#" + MGProSlide);
	var slideList = wrap.find(".js_ProSlide_list");
	var slideItems = slideList.children();
	var itemsNumber = slideItems.length;
	var btnPrev = wrap.find(".js_slide_prev");
	var btnNext = wrap.find(".js_slide_next");
	var showNext = {};
	var showPrev = {};
	var slideD;
	var dir;
	if(isVertical){
		slideD = slideItems.height();
		showNext.top = -slideD;
		showPrev.top = 0;
		dir = "top";
	}else{
		slideD = slideItems.width();
		showNext.left = -slideD;
		showPrev.left = 0;
		slideList.css("width",slideD*(itemsNumber+1));
		dir = "left";
	};
	if(itemsNumber > minItem){
		btnNext.click(function(){
			if(!slideList.is(":animated")){
				slideList.children().eq(0).clone().appendTo(slideList);
				slideList.animate(showNext,300,function(){
					slideList.children().first().remove();
					slideList.css(dir,0);
				});
			}
		});
		btnPrev.click(function(){
			if(!slideList.is(":animated")){
				slideList.children().last().clone().prependTo(slideList);
				slideList.css(dir,-slideD);
				slideList.stop(false,true).animate(showPrev,300,function(){
					slideList.children().last().remove();
				});
			}
		});
	}else{
		btnPrev.addClass("hidden");
		btnNext.addClass("hidden");
	};
	
};
function shopconform(goodslist,totalnum,totalprice){
	html = "<div id='tcc_proCart' class='tcc_proCart none'><div class='tcc_proCart_tit'><a href='javascript:void(0);' class='tcc_proCart_close fr'></a></div><div class='tcc_proCart_main'><ul class='tcc_proCart_list'></ul><p class='tcc_proCart_listD'>购物车共有 <strong></strong> 件商品，商品总金额合计：<strong></strong></p><div class='tcc_proCart_btns cf'><a class='btn01' href='../users/flow.php?step=checkout'>进入结算中心</a><a class='btn02 ml10' href='../users/flow.php?step=cart'>查看购物车</a><a class='btn03 ml10' href='javascript:void(0);'>继续购物</a></div></div></div>";
	$("body").append(html);
	ul = "";
	var liNum = goodslist.length
	for (i=0;i<liNum;i++){
		li = "<li><p class='tcc_proCart_listL'>";
		li += goodslist[i][0];
		li += "</p><p class='tcc_proCart_listR'><strong>";
		li += goodslist[i][1];
		li += "</strong>x";
		li += goodslist[i][2];
		li += "</p></li>";
		ul += li;
	};
	$(".tcc_proCart_list").append(ul);
	$(".tcc_proCart_listD strong:eq(0)").append(totalnum);
	$(".tcc_proCart_listD strong:eq(1)").append(totalprice);
	easyDialog.open({
		container : 'tcc_proCart'
	});
	function closeTcc(){
		easyDialog.close();
		$("#tcc_proCart").remove();
	};
	$("#tcc_proCart .btn03").click(function(){
		closeTcc();
	});
	$("#tcc_proCart .tcc_proCart_close").click(function(){
              //Ajax.call('flow.php?step=get_ajaxcart_info', cartcloseResponse, 'POST', 'JSON');
		closeTcc();
	});
}
function cartcloseResponse(result){
  var array=result.goods_list;
  var totalnum=result.real_goods_count+result.virtual_goods_count;
  if(totalnum==0){
      html+="<div class='ibar_cart_group_container none'>";	
  }else{
     html+="<div class='ibar_cart_group_container '>";	
  }
  
  for(var i=0; i<array.length;i++)
  {   
      
  }   
  alert(html);
   easyDialog.close();
$("#tcc_proCart").remove();
}

function clear_myput(defaultValue){
//捕获触发事件的对象，并设置为以下语句的默认对象
with(event.srcElement)
//如果当前值为默认值，则清空
if(value==defaultValue) value=""
}
function reset_myput(defaultValue){
//如果当前值为空，则重置为默认值
  if(event.srcElement.value=="")  
  {
   event.srcElement.value=defaultValue;
   event.srcElement.style.color='#a09c9c';
  }
}	

function addImg(obj)
{
  var src  = obj.parentNode.parentNode;
  var menuNum=src.getElementsByTagName("ul");
  var prohtml=menuNum[menuNum.length-1].innerHTML;
  var newNode = document.createElement("ul");
  newNode.innerHTML =prohtml;
  menuNum[menuNum.length-1].insertBefore(newNode,null);
}

$(function(){
	//导航分类弹出
	$(".nav_classify_btn").hover(function(){
		$("#nav_classifyL").toggleClass("none block");
		$("#nav_classifyL").css("z-index","99999");
		$("#nav_classifyL").mouseover(function(){
		  $("#nav_classifyL").removeClass("none");
		  $("#nav_classifyL").addClass("block");
		});
		$("#nav_classifyL").mouseout(function(){
		  $("#nav_classifyL").addClass("none");
		  $("#nav_classifyL").removeClass("block");
		});
	});
});
/**map热点自适应；rwdIMG为对应的map的父id，w1,w2为原图宽高/网页设置宽高，一般宽度为1190；w2,h2为自适应后的图片宽高，一般宽度为980**/
/**修改当前id下所有的coords**/
function rwdIMG(rwdIMG,w1,h1,w2,h2){
	var wrap = document.getElementById(rwdIMG)
	var rW=(w2 / w1);
    var rH=(h2 / h1);
    var areaLendth = wrap.getElementsByTagName('area').length;  
    for(var k=0;k<areaLendth;k++){  
        var coords=wrap.getElementsByTagName('area')[k].getAttribute('coords');  
        var arrCoords=coords.split(',');  
        for(var i=0;i<arrCoords.length;i++){  
            arrCoords[i]=i%2==0?parseInt(arrCoords[i]*rW):parseInt(arrCoords[i]*rH);  
        }  
        wrap.getElementsByTagName('area')[k].setAttribute('coords',arrCoords.join(','))  
    }  
}
/**图片宽高自适应；rwdIMG为对应的map的父id，w1,w2为原图宽高/网页设置宽高，一般宽度为1190；w2,h2为自适应后的图片宽高，一般宽度为980**/
/**修改当前id下所有的img的width，height**/
function rwdIMG1(rwdIMG,w1,w2){
	var wrap = document.getElementById(rwdIMG)
	var rW=(w2 / w1)?(w2 / w1):(980/1190);
    var areaLendth = wrap.getElementsByTagName('img').length;  
    for(var k=0;k<areaLendth;k++){  
	  if(wrap.getElementsByTagName('img')[k].getAttribute('width')!=null && wrap.getElementsByTagName('img')[k].getAttribute('height')!=null){
        var width=parseInt(parseInt(wrap.getElementsByTagName('img')[k].getAttribute('width'))*rW);  
        var height=parseInt(parseInt(wrap.getElementsByTagName('img')[k].getAttribute('height'))*rW);  
        wrap.getElementsByTagName('img')[k].setAttribute('width',width)  
        wrap.getElementsByTagName('img')[k].setAttribute('height',height) 
        wrap.getElementsByTagName('img')[k].setAttribute('widthN',width)  
        wrap.getElementsByTagName('img')[k].setAttribute('heightN',height) 
	  }
    }  
}

//图片展示滑动函数参数：id,滑动区域宽度，li的宽度
function MGShow(MGShow,ShowW,ShowL){
	var wrap = $("#"+MGShow);
	var picList = wrap.find(".userPicShow_pics");
	var li = wrap.find(".userPicShow_pics").find("img");
	var prev = wrap.find(".userPicShow_prev");
	var next = wrap.find(".userPicShow_next");
	next.one("mouseenter",function(){
	  if(picList.innerWidth() > ShowW){
		  next.addClass("userPicShow_btnEnable");
	  }
	});
	function animate(left){
		picList.stop(false,true).animate({"left":left},200)
	};
	next.click(function(){
		var w = picList.innerWidth() - ShowW;
		var left = parseInt(picList.css("left"));
		if(w >= -left){
			if(w+left<ShowL){
				left = -w;
				animate(left);
				next.removeClass("userPicShow_btnEnable");
				next.attr("title","已经是最后一个了")
				prev.addClass("userPicShow_btnEnable");
			}else{
				left = left - ShowL;
				animate(left);
				prev.addClass("userPicShow_btnEnable");
				prev.attr("title","上一个")
			}
		}
	});
	prev.click(function(){
		var w = picList.innerWidth() - ShowW;
		var left = parseInt(picList.css("left"));
		if(w >= -left){
			if(-left<ShowL){
				left = 0;
				animate(left);
				prev.removeClass("userPicShow_btnEnable");
				prev.attr("title","这是第一个")
				next.addClass("userPicShow_btnEnable");
			}else{
				left = left + ShowL;
				animate(left);
				next.addClass("userPicShow_btnEnable");
				next.attr("title","下一个")
			}
		}
	});
}

//图片展示滑动函数参数：id,滑动区域宽度，liNum,显示的li个数
function MGShow1(MGShow,liNum){
	var wrap = $("#"+MGShow);
	var picwrap = wrap.find(".MGShow_picsWrap");
	var picbox = wrap.find(".MGShow_picsWrapbox");
	var picList = wrap.find(".MGShow_pics");
	var picListIn = wrap.find(".MGShow_picList");
	var picListli = wrap.find(".MGShow_picsli");
	var picListliL = picListli.length;
	var ShowW = picwrap.width();
	var ShowL = picListli.outerWidth(true)?picListli.outerWidth(true):picListli.width();
	var prev = wrap.find(".userPicShow_prev");
	var next = wrap.find(".userPicShow_next");
	if(picListliL<=liNum){
		picListIn.css("width",ShowW);
		prev.addClass("none");
		next.addClass("none");
		return;
	}else if(picListliL>liNum){
		picListli.css("width",(parseInt(picListli.css("width"))));
		picListli.css("margin-left",(parseInt(picListli.eq(1).css("marginLeft"))));
		picListli.eq(0).css("margin-left",0);
		picbox.css("width",(picListli.width()*picListliL)+(parseInt(picListli.eq(1).css("marginLeft"))*(picListliL)));
		ShowL = picListli.eq(1).outerWidth(true)?picListli.eq(1).outerWidth(true):picListli.eq(1).width();
	}

	next.one("mouseenter",function(){
		pInW = picListIn.outerWidth(true)?picListli.outerWidth(true):picListli.width();
	  if(pInW > ShowW){
		  next.addClass("userPicShow_btnEnable");
	  }
	});
	function animate(left){
		picListIn.stop(false,true).animate({"left":left},200)
	};
	next.click(function(){
		var w =( picListIn.outerWidth(true) - ShowW)?(picListIn.outerWidth(true) - ShowW):(picListIn.width() - ShowW);
		var left = parseInt(picListIn.css("left"));
		if(w >= -left){
			if(w+left<ShowL){
				left = -w;
				animate(left);
				next.removeClass("userPicShow_btnEnable");
				next.attr("title","已经是最后一个了")
				prev.addClass("userPicShow_btnEnable");
			}else{
				left = left - ShowL;
				animate(left);
				prev.addClass("userPicShow_btnEnable");
				prev.attr("title","上一个")
			}
		}
	});
	prev.click(function(){
		var w =( picListIn.outerWidth(true) - ShowW)?(picListIn.outerWidth(true) - ShowW):(picListIn.width() - ShowW);
		var left = parseInt(picListIn.css("left"));
		if(w >= -left){
			if(-left<ShowL){
				left = 0;
				animate(left);
				prev.removeClass("userPicShow_btnEnable");
				prev.attr("title","这是第一个")
				next.addClass("userPicShow_btnEnable");
			}else{
				left = left + ShowL;
				animate(left);
				next.addClass("userPicShow_btnEnable");
				next.attr("title","下一个")
			}
		}
	});
}

//IE 生产getElementsByClassName
//if (!document.getElementsByClassName) {
//  document.getElementsByClassName = function(className, element) {
//	var children = (element || document).getElementsByTagName('*');
//	var elements = new Array();
//	for (var i = 0; i < children.length; i++) {
//	  var child = children[i];
//	  var classNames = child.className.split(' ');
//	  for (var j = 0; j < classNames.length; j++) {
//		if (classNames[j] == className) {
//		  elements.push(child);
//		  break;
//		}
//	  }
//	}
//	return elements;
//  };
//}
/***********************
* 函数：判断滚轮滚动方向
* 作者：walkingp
* 参数：event，obj对象
* 返回：滚轮方向 1：向上 -1：向下
*************************/
//var t1=document.getElementById("wheelDelta");
//var scrollFunc=function(e){
//    var direct=0;
//    e=e || window.event;
//    if(e.wheelDelta){//IE/Opera/Chrome
//       // t1.value=e.wheelDelta;
//		if(e.wheelDelta>0){
//			t1.value=1;
//		}else{
//			t1.value=-1;
//		}
//    }else if(e.detail){//Firefox
//       // t1.value=e.detail;
//		if(e.wheelDelta>0){
//			t1.value=-1;
//		}else{
//			t1.value=1;
//		}
//    }
//}
///*注册事件*/
//if(document.addEventListener){
//	document.addEventListener('DOMMouseScroll',scrollFunc,false);
//}//W3C
//window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome/Safari

//Cookie参数：名字，值，存储有效期（毫秒）
function setCookie(name,value,days) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + days); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
}
function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 
function delCookie(name) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
}


function checkmobilephone(tel) {
/*     var reg = /^(?:13\d|15[012356789]|18[0123456789]|17[0123456789]|147)-?\d{5}(\d{3}|\*{3})$/;
    if (reg.test(tel)) {
        return true;
    } else {
        return false;
    }*/
	return true;
}

function chenckhomephone(tel) {
    var reg = /\d{3}-\d{8}|\d{4}-\d{7}/;
    var res = reg.test(tel);
    if (!res) {
        return false;
    } else {
        return true;
    }
}

function checkmail(email) {
    var reg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    var res = reg.test(email);
    if (!res) {
        return false;
    } else {
        return true;
    }
}

function checkQQ(qq) {
    var reg = /^\s*\d{4,12}\s*$/g;
    var res = reg.test(qq);
    if (!res) {
        return false;
    } else {
        return true;
    }
}
//异步获取数据
function getdata(url,datamap,id){
  $.ajax({
    url:url,
    type:'post',
    dataType:'json',
    data:datamap,
    success:function(data){
      $('#'+id).html(data);
    }
  });
}
