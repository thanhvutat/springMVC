// １列の最大文字数
const DATATABLES_COL_MAX_LENGTH = 11;
// １列の最大文字数を超えた場合の省略文字
const DATATABLES_COL_ELLIPSIS = '...';

// 休日（グローバル変数）
var holidays = null;

/**
 * 最大文字数を超えた場合、最大文字数まで短縮した文字列を返す。 最大文字数を超えていない場合、文字列をそのまま返す。
 * 
 * @param str 文字列
 * @returns
 */
function getShortStringRemoveNewLine(str) {
  var result = null;

  if (isEmpty(str)) {
    result = ''
  } else {
    // 改行文字列を削除する
    var tmp = str.replace(/\r?\n/g, "");
    if (tmp.length > DATATABLES_COL_MAX_LENGTH) {
      result = tmp.substr(0, DATATABLES_COL_MAX_LENGTH)
          + DATATABLES_COL_ELLIPSIS;
    } else {
      result = tmp;
    }
  }
  return result;
}

/**
 * [data-number-format="true"]を指定しているフィールドに数値のみ入力を許可する
 */
$(function() {
  $('[data-number-format="true"]').on('keydown', function(e) {
      var k = e.keyCode;
      // 0～9, テンキ―0～9, スペース, backspace, delete, →, ←, 以外は入力キャンセル
      if(!((k >= 48 && k <= 57) || (k >= 96 && k <= 105) || k == 32 || k == 8 || k == 46 || k == 39 || k == 37)) {
          return false;
      }
  });
});

/**
 * [data-number-format="true"]を指定しているフィールドに対して、コピー&ペーストを禁止する
 */
$(function() {
  $('[data-number-format="true"]').on('paste', function(e) {
        return false;
  });
});


/**
 * 検索条件クリア
 * 
 * @param table テーブル
 * @returns
 */
function clearSearchConditon(table) {
  table.search('');
  table.columns().search('');
  $('input.column_filter').val('');
  table.state.clear();
  table.draw();
}

/**
 * 列指定検索テキストボックスの値復元
 * 
 * @param table テーブル
 * @param col 列
 * @returns
 */
function restoreColumnFilter(table, col) {
  var str = table.columns(col).search()[0];
  $('#col' + col + '_filter').val(str);
}

/**
 * Datatables の選択チェックボックスでチェックされた行のキーを hidden 項目に設定する ajax で取得したデータ中に
 * alternateKey が含まれている前提
 * 
 * @param table テーブル
 * @param selectColumn チェックボックス列
 * @param hiddenId alternateKeyのID
 * @returns
 */
function setSelectKey(table, selectColumn, hiddenId) {
  var rowsSelected = table.column(selectColumn).checkboxes.selected();
  var rowsSearchApplied = [];
  var checked = [];

  table.rows({
    'search' : 'applied'
  }).every(function(rowIdx, tableLoop, rowLoop) {
    var data = this.data();
    rowsSearchApplied.push(data.alternateKey);
  });

  for (var i = 0; i < rowsSelected.length; i++) {
    if (rowsSearchApplied.indexOf(rowsSelected[i]) >= 0) {
      checked.push(rowsSelected[i]);
    }
  }

  $(hiddenId).val(checked.join(SEPARATOR_MULTIPLE_SELECT));
}

/**
 * Datatables の選択チェックボックスを全て未選択にする
 * 
 * @param table テーブル
 * @param selectColumn チェックボックス列
 * @returns
 */
function deselectAllCheckboxes(table, selectColumn) {
  table.column(selectColumn).checkboxes.deselectAll();
}

/**
 * サイドメニューの開閉状態を記憶する
 * @returns
 */
function toggleMenu() {
  $.cookie("is_open", $("body").hasClass("sidebar-collapse") ? "1" : "0", {
    path : "/"
  });
  var cookies = document.cookie.split("; ");
  console.log(cookies)
}

/**
 * ダブルクリック防止(未整備)
 */
//$(function() {
//  $(
//      ':submit, #deleteBatch, #unlockBatch, #exportCsv, #exportVCardPHS, #exportVCardSmartPhone')
//      .click(function(e) {
//        var element = $(this);
//
//        if (element.data("isclicked")) {
//          alert("連続してボタンをクリックしないでください。");
//          e.preventDefault();
//          e.stopPropagation();
//        } else {
//          element.data("isclicked", true);
//          setTimeout(function() {
//            element.removeData("isclicked");
//          }, 5000);
//        }
//      });
//});

/**
 * 確認用Modalダイアログを生成する。formを生成し、パラメータ付きURLをPOSTする
 * 
 * @param url post先
 * @param type ダイアログ種類(デフォルト:疑問符)
 * @param bodyMessage 本文
 * @param tokenName トークン名
 * @param tokenValue トークン値
 * @returns
 */
function createModalDialogForParam(id, url, type, bodyMessage, tokenName,
    tokenValue) {
  var icon;
  var title;
  if (type == 'info') {
    icon = '<i class="fa fa-info"></i>';
    title = '情報ダイアログ';
  } else if (type == 'warning') {
    icon = '<i class="fa fa-warning"></i>';
    title = '警告ダイアログ';
  } else if (type == 'error') {
    icon = '<i class="fa fa-ban"></i>';
    title = 'エラーダイアログ';
  } else {
    icon = '<i class="fa fa-question-circle"></i>';
    title = '疑問符ダイアログ';
  }
  var html = '';
  html += ' <!-- modal dialog -->';
  html += '<div class="modal fade" id="' + id + '">';
  html += '<div class="modal-dialog">';
  html += ' <div class="modal-content">';
  html += '<div class="modal-header">';
  html += '<button type="button" class="close" data-dismiss="modal"';
  html += ' aria-label="Close">';
  html += '<span aria-hidden="true">&times;</span>';
  html += '</button>';
  html += '<h4 class="modal-title fa fa-books">';
  html += icon;
  html += '&nbsp;';
  html += title;
  html += '</h4>';
  html += '</div>';
  html += '<div class="modal-body">';
  html += '<p>';
  html += bodyMessage;
  html += '</p>';
  html += '</div>';
  html += '<div class="modal-footer">';
  if (type != 'info' && type != 'error') {
    if (url == null || url == "") {
      html += '<button id="dialog_ok_' + id + '" type="button" class="btn btn-primary" data-dismiss="modal">';
      html += '<i style="margin-right: 5px;"></i>';
      html += 'OK';
      html += '</button>';
    } else {

      html += '<form';
      html += ' action="';
      html += url;
      html += '"';
      html += ' method="post"';
      html += ' enctype="multipart/form-data">';
      html += '<button type="submit" class="btn btn-primary">';
      html += '<i style="margin-right: 5px;"></i>';
      html += 'OK';
      html += '</button>';
    }
  }
  html += ' <button type="button" class="btn btn-primary" data-dismiss="modal">';
  html += ' 閉じる';
  html += '</button>';
  html += '<input type="hidden" name="';
  html += tokenName;
  html += '" value="';
  html += tokenValue;
  html += '"/>';
  if (type != 'info' && type != 'error') {
    html += '</form>';
  }
  html += '</div>';
  html += '</div>';
  html += '</div>';
  html += '</div>';
  html += '<!-- /.modal dialog -->'

  document.write(html);
};

/**
 * 確認用Modalダイアログを指定箇所へ生成する。 指定したformの情報をすべてPOSTする (formは生成しない)
 * 
 * @param id ダイアログID
 * @param formId フォームID
 * @param url post先
 * @param type ダイアログ種類(デフォルト:疑問符)
 * @param appendObjId ダイアログ追加先オブジェクト
 * @param bodyMessage 本文
 * @returns
 */
function createModalDialogToForm(id, formId, url, type, appendObjId, bodyMessage) {
  var icon;
  var title;
  if (type == 'info') {
    icon = '<i class="fa fa-info"></i>';
    title = '情報ダイアログ';
  } else if (type == 'warning') {
    icon = '<i class="fa fa-warning"></i>';
    title = '警告ダイアログ';
  } else if (type == 'error') {
    icon = '<i class="fa fa-ban"></i>';
    title = 'エラーダイアログ';
  } else {
    icon = '<i class="fa fa-question-circle"></i>';
    title = '疑問符ダイアログ';
  }

  var html = '';
  html += ' <!-- modal dialog -->';
  html += '<div class="modal fade" id="' + id +'">';
  html += '<div class="modal-dialog">';
  html += ' <div class="modal-content">';
  html += '<div class="modal-header">';
  html += '<button type="button" class="close" data-dismiss="modal"';
  html += ' aria-label="Close">';
  html += '<span aria-hidden="true">&times;</span>';
  html += '</button>';
  html += '<h4 class="modal-title fa fa-books">';
  html += icon;
  html += '&nbsp;';
  html += title;
  html += '</h4>';
  html += '</div>';
  html += '<div class="modal-body">';
  html += '<p>';
  html += bodyMessage;
  html += '</p>';
  html += '</div>';
  html += '<div class="modal-footer">';
  if (type != 'info' && type != 'error') {
    html += '<button type="button" id="dialog_ok_' + id +'" class="btn btn-primary" '
    
    if (url == null || url == "") {
      html += 'data-dismiss="modal" ';
    } else {
      html += 'onclick=\'submitEditAction("' + formId + '","' + url + '");\''
    }
    html += '>';
    html += '<i style="margin-right: 5px;"></i>';
    html += 'OK';
    html += '</button>';
  }
  html += ' <button type="button" class="btn btn-primary" data-dismiss="modal">';
  html += ' 閉じる';
  html += '</button>';
  html += '</div>';
  html += '</div>';
  html += '</div>';
  html += '</div>';
  html += '<!-- /.modal dialog -->'
  $(appendObjId).append(html);
};


/**
 * 休日を設定する
 * 
 * @param day 日
 * @returns
 */
function setHoliday(day) {
  var dayString = moment(day).format('YYYY/MM/DD');
  var holiday = holidays[dayString];
  var daySettings = new Object();
  if (holiday != undefined) {
    daySettings.enabled = true;
    daySettings.classes = 'ui-datepicker-holiday';
    daySettings.tooltip = holiday;
  } else if (day.getDay() == 0) {
    daySettings.enabled = true;
    daySettings.classes = 'ui-datepicker-sunday';
  } else if (day.getDay() == 6) {
    daySettings.enabled = true;
    daySettings.classes = 'ui-datepicker-saturday';
  } else {

  }

  return daySettings;
}

/**
 * 休日データを取得し、指定されたオブジェクトに datepicker を適用する（年月日）
 * 
 * @param obj 対象オブジェクト
 * @returns
 */
function datepicker(obj) {
  if (holidays == null) {
    // holidaysが未設定の場合のみ休日データを取得する（同期処理）
    $.ajax({
      type : 'GET',
      url : getContextPath() + '',
      timeout : 10000,
      cache : true,
      dataType : 'json',
      async : false
    }).done(function(response, textStatus, jqXHR) {
      holidays = new Object();
      $.each(response, function(i, value) {
        holidays[value.holiday] = value.desc;
      });
      setDatepicker(obj);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      holidays = new Object();
      setDatepicker(obj);
    });
  } else {
    setDatepicker(obj);
  }
}

/**
 * 指定されたオブジェクトに datepicker を適用する（年月日）
 * 
 * @param obj 対象オブジェクト
 * @returns
 */
function setDatepicker(obj) {
  $(obj).datepicker({
    autoclose : true,
    language : 'ja',
    format : 'yyyy/mm/dd',
    todayBtn : true,
    todayHighlight : true,
    beforeShowDay : setHoliday,
    enableOnReadonly : false
  });
}

/**
 * 指定されたオブジェクトに datepicker を適用する（年月）
 * 
 * @param obj 対象オブジェクト
 * @returns
 */
function datepickerYearMonth(obj) {
  setDatepickerYearMonth(obj);
}

/**
 * 指定されたオブジェクトに datepicker を適用する（年月）
 * 
 * @param obj 対象オブジェクト
 * @returns
 */
function setDatepickerYearMonth(obj) {
  $(obj).datepicker({
    autoclose : true,
    language : 'ja',
    format : 'yyyy/mm',
    minViewMode : 'months',
    todayBtn : true,
    enableOnReadonly : false
  });
}

/**
 * 指定されたオブジェクトに datetimepicker を適用する（年月日 時分）
 * 
 * @param obj 対象オブジェクト
 * @returns
 */
function setDatetimepicker(obj) {
  $(obj).datetimepicker({
    locale: 'ja',
    format: 'YYYY/MM/DD HH:mm'

  });
}



/**
 * サニタイジングした値を設定する
 * 
 * @param obj 対象オブジェクト
 * @param val 値
 * @param isReplaceEmpty 置き換え判定
 * @returns
 */
function setEscapedValueDatepicker(obj, val, isReplaceEmpty) {
  if (isReplaceEmpty || isEmpty(val) == false) {
    $(obj).datepicker('update', escapeHTML(val));
  }
}
/**
 * サニタイジングする
 * 
 * @param val 値
 * @returns
 */
function escapeHTML(val) {
  return $('<div>').text(val).html();
}

/**
 * contextpath （末尾に / 無し）を取得する
 * 
 * @returns
 */
function getContextPath() {
  var contextPath = '';
  var pathName = location.pathname;
  if (isEmpty(pathName) == false) {
    // 先頭の「/」を除き、先頭の「/」のインデックスを取得
    var index = pathName.substr(1).indexOf('/') + 1;
    if (index > 0) {
      contextPath = pathName.substr(0, index);
    }
  }
  return contextPath;
}
/**
 * 文字列の空チェック
 * 
 * @param str 文字列
 * @returns
 */
function isEmpty(str) {
  if (str == null || str == undefined || str == '') {
    return true;
  } else {
    return false;
  }
}

/**
 * 名前を指定し、新しいウィンドウをタブで開く
 * 
 * @param url URL
 * @returns
 */
function openNewWindowByName(url) {
  window.open(url, '_blank');
}

/**
 * action を設定後、submit
 * 
 * @param formId フォームID
 * @param action actionの値
 * @returns
 */
function submitEditAction(formId, action) {
  $(formId).attr('action', encodeURI(action));
  $(formId).submit();
}

/**
 * 親画面の DataTablesをリロードし、自画面を閉じる
 * 
 * @param table テーブル
 * @returns
 */
// (DataTablesPack/datatables.min.js、app2/js/common.js が必要)
function reloadDataTablesAndCloseOwnWindow(table) {
  if (table != null) {
    table.ajax.reload();
  }
  closeOwnWindow();
}

/**
 * 自画面を閉じる
 * 
 * @returns
 */
function closeOwnWindow() {
  window.close();
}

/**
 * 指定した画面を新規ウィンドウで開く
 * 
 * @returns
 */
function openNewCommonWindow(url, windowName , scrollbars) {
  //画面名
  if(windowName == null || windowName == ""){
    windowName = "newWindow";
  }
  //サブウインドウの横幅
  var subw = 1000;
  // サブウインドウの高さ
  var subh = 670; 
  // 表示座標の計算
  var subx = ( screen.availWidth  - subw ) / 2;
  var suby = ( screen.availHeight - subh ) / 2 - 20;
  //スクロールバーの有無
  if(scrollbars == null || scrollbars == ""){
	  var openWindow = window.open(url, windowName, "width=" + subw + ",height=" + subh + ",top=" + suby + ",left=" + subx);
  }else{
	  var openWindow = window.open(url, windowName, "width=" + subw + ",height=" + subh + ",top=" + suby + ",left=" + subx +",scrollbars=yes");
  }
  LoadModalDiv();
  return openWindow;
}

function LoadModalDiv(){
  $("#bodyBackground").css('display','block');
  $("#headerBackground").css('display','block');
}


function HideModalDiv(){
  $("#bodyBackground").css('display','none' );
  $("#headerBackground").css('display','none');
}

/**
 * 依存関係のある入力項目の制御
 * 
 * @param child 子要素
 * @param url URL
 * @param blankOption ブランク行つけるか判定
 * @returns
 */
function getChildOptions(child, url, blankOption) {
  $.get(encodeURI(url), function(data) {
    var childOptions = $.parseJSON(data);
    $(child).html('');
    if (blankOption == true) {
      $(child).append('<option value=""></option>');
    }
    for (var i = 0; i < childOptions.length; i++) {
      $(child).append(
          '<option value="' + escapeHTML(childOptions[i].value) + '">'
              + escapeHTML(childOptions[i].label) + '</option>');
    }
    // 値が変更されたため、手動でchangeイベントを発生させる
    $(child).trigger('change');
  })
}

/**
 * 検索条件の必須チェック
 * @param value 値
 * @param msg メッセージ
 * @returns
 */
function checkRequiredSearchCriteria(value, msg){
 if(value == null || value == ""){
   if(msg == null || msg == ""){
     msg = "必須入力エラーです。";
   }
   $('#modal-required-error').modal('show');
   $('#modal-required-error-message').text(msg);
   throw new Error('入力チェックエラー');
 }
}

/**
 * 自画面を再描画
 * @param url 遷移先url
 * @returns
 */
function reLoad(url){
  location.href = url;
}

//--------------INPUT MASK------------------------
//数値の input-mask の標準設定
//Inputmask.extendAliases({
//  'numeric' : {
//    'groupSeparator' : ',',
//    'autoGroup' : true,
//    'removeMaskOnSubmit' : true
//  }
//});

// 指定されたオブジェクトに数値（カンマ編集）の input-mask を適用する
//function numericCommaEditing(obj) {
//  $(obj).inputmask({
//    'alias' : 'numeric'
//  });
//}

// 指定されたオブジェクトに数値（カンマ編集）の input-mask を適用する（接尾辞あり）
//function numericCommaEditingSuffix(obj, strSuffix) {
//  $(obj).inputmask({
//    'alias' : 'numeric',
//    'suffix' : strSuffix
//  });
//}

//指定されたオブジェクトに金額形式の input-mask を適用する
//function numericMoneyFormat(obj) {
//  $(obj).inputmask({
//    'alias' : 'numeric',
//    'prefix' : '¥'
//  });
//}

// 指定されたオブジェクトに半角文字（半角英数字記号）の input-mask を適用する
//function halfWidthCharacter(obj) {
//  $(obj).inputmask({
//    'regex' : '^[a-zA-Z0-9 -/:-@\\[-\\`\\{-\\~]*$'
//  });
//}

// 別Window、別タブの「×」ボタン押下時の処理
function OnClose() {
  if (window.opener != null && !window.opener.closed) {
    var parentWindow = window.opener;
    reloadDataTablesAndCloseOwnWindow(parentWindow == null ? null : parentWindow.tables);
  }
}

//DataTablesのAjax例外時の処理 
//$.fn.dataTable.ext.errMode = function ( e, settings, helpPage, message ) { ajaxErrorProcess()};

//ajaxエラー処理
function ajaxErrorProcess() {
  $('#main-body').css('padding-right', '');
  $('#modal-error-ajaxerror').modal();
}

//指定したURLに通信後、プリンタ印刷する
function printOutPdf(url){
  $.ajax({
   'url': url,
   'type' : 'GET'
})
.then(
 // 通信成功時のコールバック
 function (data) {
   var items = $.parseJSON(data);
   var result = items.pdf_output_path.replace(/\\/g, '/');
   objPdf.src = "file:" + result;
   //前提として、呼び出し元でプリンタ用Objectを作成すること
   objPdf.printAll();

 },
 // 通信失敗時のコールバック
 function () {
     alert("印刷失敗");
});
}


