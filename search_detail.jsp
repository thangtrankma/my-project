<%-- $Id: search_detail.jsp 515 2012-12-24 03:15:18Z kawao $ --%>
<%@ page pageEncoding="Windows-31J" %>
<%@ include file="/jsp/page_header.jsp" %>

<html:html locale="true">
<head>
<link rel="stylesheet" type="text/css" href="/people/jsp/style.css">
<title>
<%@ include file="/jsp/custom/public_search_title.html" %>
</title>

<%@ include file="/jsp/common-scripts.jsp" %>

<script type="text/javascript">
<!--
function openAsahiJinbutsuJiten(formName) {
  newWindowOpen('', 'asahiJinbutsuJitenForm', 'location=no,directories=no,menubar=no,status=no,toolbar=yes,resizable=yes,scrollbars=yes');
  document.forms[formName].action = '/people/db/publicSearchAsahiJinbutsuJiten';
  document.forms[formName].target = 'asahiJinbutsuJitenForm';
  document.forms[formName].method = 'post';
  document.forms[formName].submit();
}
function openPrintDetail(formName) {
  newWindowOpen('', 'asahiJinbutsuPrintDetail', 'location=no,directories=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes');
  document.forms[formName].action = '/people/db/publicSearchPrintDetail';
  document.forms[formName].target = 'asahiJinbutsuPrintDetail';
  document.forms[formName].method = 'get';
  document.forms[formName].submit();
}
// -->
</script>

</head>
<body bgcolor="#FFFFFF" onunload="closeChild()">

<%@ include file="/jsp/custom/public_search_header.html" %>
<div align="right">
  <form name="printLink">
  <html:hidden name="publicSearchDetailBean" property="inputCode" />
  <html:link href="javascript:openPrintDetail('printLink')">印刷用詳細画面表示</html:link>
  </form>
</div>

<table align="center" width="600" wrap=hard>
  <tr>
    <td colspan="3">
      <form name="topButtons" id="0">
      <asahi:forwardButton action="/publicSearchResult" function="invokeAction" form="topButtons" value="　一覧表示画面へ　" style="buttonAll" />
      　　<asahi:forwardButton action="/publicSearchInput" function="invokeAction" form="topButtons" value="検索条件入力画面へ" style="buttonAll" />
      <html:hidden property="search" value="false" />
      </form>
    </td>
  </tr>

  <tr><td>詳細表示 <span class="alert">(社外秘)</span></td></tr>
  <tr>
    <td>
      <b>
      <bean:write name="publicSearchDetailBean" property="tourokumei" />
      <logic:notEqual name="publicSearchDetailBean" property="tourokumeiYomi" value="">
        (<bean:write name="publicSearchDetailBean" property="tourokumeiYomi" />)
      </logic:notEqual>
      <logic:equal name="publicSearchDetailBean" property="kojin" value="true">[故人]</logic:equal>
      </b>
    </td>
    <td>更新日　<bean:write name="publicSearchDetailBean" property="updateDate" />&nbsp;</td>
    <td>
      &nbsp;
      <logic:present name="publicSearchDetailBean" property="jinbutsuPub">
        <logic:equal name="publicSearchDetailBean" property="jinbutsuPub" value="＊＊公開不可＊＊">
          <span class="private"><bean:write name="publicSearchDetailBean" property="jinbutsuPub" /></span>
        </logic:equal>
        <logic:equal name="publicSearchDetailBean" property="jinbutsuPub" value="＊＊削除希望＊＊">
          <span class="delete"><bean:write name="publicSearchDetailBean" property="jinbutsuPub" /></span>
        </logic:equal>
      </logic:present>
    </td>
  </tr>

  <tr>
    <td colspan="3">
      <table border="1" align="center" bgcolor="#FFFFFF" cellpadding="5" width="600">

        <tr>
          <th class="caption" nowrap>本名</th>
          <td width="230">
            <logic:equal name="controlBean" property="showHonmyou" value="true">
              <bean:write name="publicSearchDetailBean" property="honmyou" />
              <logic:present name="publicSearchDetailBean" property="honmyou"> (<bean:write name="publicSearchDetailBean" property="honmyouYomi" />)</logic:present>
              <logic:present name="publicSearchDetailBean" property="honmyouPub">
                <logic:equal name="publicSearchDetailBean" property="honmyouPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="honmyouPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="honmyouPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="honmyouPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>

          <th class="caption" nowrap>生年月日</th>
          <td colspan="2">
            <logic:equal name="controlBean" property="showSeinengappi" value="true">
              <bean:write name="publicSearchDetailBean" property="seinenYear" /><logic:notPresent name="publicSearchDetailBean" property="seinenYear">　</logic:notPresent>(<bean:write name="publicSearchDetailBean" property="warekiSeinen" />)年<bean:write name="publicSearchDetailBean" property="seinenMonth" /><logic:notPresent name="publicSearchDetailBean" property="seinenMonth">　</logic:notPresent>月<bean:write name="publicSearchDetailBean" property="seinenDay" /><logic:notPresent name="publicSearchDetailBean" property="seinenDay">　</logic:notPresent>日
              <logic:present name="publicSearchDetailBean" property="seinengappiPub">
                <logic:equal name="publicSearchDetailBean" property="seinengappiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="seinengappiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="seinengappiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="seinengappiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            <logic:equal name="controlBean" property="showSeinengappi" value="false">&nbsp;</logic:equal>
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>筆名</th>
          <td width="230">
            <logic:equal name="controlBean" property="showHitsumei" value="true">
              <bean:write name="publicSearchDetailBean" property="hitsumei" />
              <logic:present name="publicSearchDetailBean" property="hitsumeiYomi">（<bean:write name="publicSearchDetailBean" property="hitsumeiYomi" />）</logic:present>
              <logic:present name="publicSearchDetailBean" property="hitsumeiPub">
                <logic:equal name="publicSearchDetailBean" property="hitsumeiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="hitsumeiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="hitsumeiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="hitsumeiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>

          <th class="caption" nowrap>死亡年月日</th>
          <td colspan="2">
            <logic:equal name="controlBean" property="showShibou" value="true">
              <bean:write name="publicSearchDetailBean" property="shibouYear" /><logic:notPresent name="publicSearchDetailBean" property="shibouYear">　</logic:notPresent>年<bean:write name="publicSearchDetailBean" property="shibouMonth" /><logic:notPresent name="publicSearchDetailBean" property="shibouMonth">　</logic:notPresent>月<bean:write name="publicSearchDetailBean" property="shibouDay" /><logic:notPresent name="publicSearchDetailBean" property="shibouDay">　</logic:notPresent>日
            </logic:equal>
            <logic:equal name="controlBean" property="showShibou" value="false">&nbsp;</logic:equal>
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>名前の説明</th>
          <td colspan="2">
            <logic:equal name="controlBean" property="showSeijiSetsumei" value="true">
              <bean:write name="publicSearchDetailBean" property="seijiSetsumei" />
              <logic:present name="publicSearchDetailBean" property="seijiSetsumeiPub">
                <logic:equal name="publicSearchDetailBean" property="seijiSetsumeiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="seijiSetsumeiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="seijiSetsumeiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="seijiSetsumeiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>

          <th class="caption" nowrap>性別</th>
          <td>
            <logic:equal name="controlBean" property="showSeibetsu" value="true">
              <bean:write name="publicSearchDetailBean" property="seibetsu" />
              <logic:equal name="publicSearchDetailBean" property="emptySeibetsu" value="false">
                <logic:present name="publicSearchDetailBean" property="seibetsuPub">
                  <logic:equal name="publicSearchDetailBean" property="seibetsuPub" value="＊＊公開不可＊＊">
                  　<span class="private"><bean:write name="publicSearchDetailBean" property="seibetsuPub" /></span>
                  </logic:equal>
                  <logic:equal name="publicSearchDetailBean" property="seibetsuPub" value="＊＊削除希望＊＊">
                  　<span class="delete"><bean:write name="publicSearchDetailBean" property="seibetsuPub" /></span>
                  </logic:equal>
                </logic:present>
              </logic:equal>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>出生地</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showShusseiTodouhuken" value="true">
              <bean:write name="publicSearchDetailBean" property="shusseiTodouhuken" />
              <logic:present name="publicSearchDetailBean" property="shusseiTodouhukenPub">
                <logic:equal name="publicSearchDetailBean" property="shusseiTodouhukenPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shusseiTodouhukenPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shusseiTodouhukenPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shusseiTodouhukenPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
            <logic:equal name="controlBean" property="showShusseiShichou" value="true">
              <bean:write name="publicSearchDetailBean" property="shusseiShichou" />
              <logic:present name="publicSearchDetailBean" property="shusseiShichouPub">
                <logic:equal name="publicSearchDetailBean" property="shusseiShichouPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shusseiShichouPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shusseiShichouPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shusseiShichouPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>出身地</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showShusshinTodouhuken" value="true">
              <bean:write name="publicSearchDetailBean" property="shusshinTodouhuken" />
              <logic:present name="publicSearchDetailBean" property="shusshinTodouhukenPub">
                <logic:equal name="publicSearchDetailBean" property="shusshinTodouhukenPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shusshinTodouhukenPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shusshinTodouhukenPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shusshinTodouhukenPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
            <logic:equal name="controlBean" property="showShusshinShichou" value="true">
              <bean:write name="publicSearchDetailBean" property="shusshinShichou" />
              <logic:present name="publicSearchDetailBean" property="shusshinShichouPub">
                <logic:equal name="publicSearchDetailBean" property="shusshinShichouPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shusshinShichouPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shusshinShichouPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shusshinShichouPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
          </td>
        </tr>

        <tr>
          <th class="caption" rowspan="2" nowrap>現職</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showGenshoku" value="true">
              <bean:write name="publicSearchDetailBean" property="genshoku" />
              <logic:present name="publicSearchDetailBean" property="genshokuPub">
                <logic:equal name="publicSearchDetailBean" property="genshokuPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="genshokuPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="genshokuPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="genshokuPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <logic:equal name="controlBean" property="showGenshoku" value="true">
              [政党]<bean:write name="publicSearchDetailBean" property="seitou" />
            　[院内会派]<bean:write name="publicSearchDetailBean" property="kaiha" />
            　[選挙区]<bean:write name="publicSearchDetailBean" property="senkyoku" />
            　[当選回数]<bean:write name="publicSearchDetailBean" property="tousenKaisuu" />
            </logic:equal>
            <logic:equal name="controlBean" property="showGenshoku" value="false">&nbsp;</logic:equal>
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>所属</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showShozoku" value="true">
              <bean:write name="publicSearchDetailBean" property="shozoku" />
              <logic:present name="publicSearchDetailBean" property="shozokuPub">
                <logic:equal name="publicSearchDetailBean" property="shozokuPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shozokuPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shozokuPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shozokuPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>元職</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showMotoshoku" value="true">
              <bean:write name="publicSearchDetailBean" property="motoshoku" />
              <logic:present name="publicSearchDetailBean" property="motoshokuPub">
                <logic:equal name="publicSearchDetailBean" property="motoshokuPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="motoshokuPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="motoshokuPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="motoshokuPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" rowspan="2" nowrap>勤務先<br>連絡先1</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showRenrakusakiJuusho" value="true">
              <logic:present name="publicSearchDetailBean" property="renrakusakiYuubinbangou">〒<bean:write name="publicSearchDetailBean" property="renrakusakiYuubinbangou" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="renrakusakiJuusho">　<bean:write name="publicSearchDetailBean" property="renrakusakiJuusho" /></logic:present>
              <bean:write name="publicSearchDetailBean" property="renrakusakiMeishou" />
              <logic:present name="publicSearchDetailBean" property="renrakusakiJuushoPub">
                <logic:equal name="publicSearchDetailBean" property="renrakusakiJuushoPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="renrakusakiJuushoPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="renrakusakiJuushoPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="renrakusakiJuushoPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <logic:equal name="controlBean" property="showRenrakusakiDenwa" value="true">
              <logic:present name="publicSearchDetailBean" property="renrakusakiDenwa">TEL <bean:write name="publicSearchDetailBean" property="renrakusakiDenwa" /> <logic:present name="publicSearchDetailBean" property="renrakusakiDenwaShurui">(<bean:write name="publicSearchDetailBean" property="renrakusakiDenwaShurui" />)</logic:present></logic:present>
              <logic:present name="publicSearchDetailBean" property="renrakusakiNaisen">（内線 <bean:write name="publicSearchDetailBean" property="renrakusakiNaisen" />）</logic:present>
              <logic:present name="publicSearchDetailBean" property="renrakusakiDenwaPub">
                <logic:equal name="publicSearchDetailBean" property="renrakusakiDenwaPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="renrakusakiDenwaPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="renrakusakiDenwaPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="renrakusakiDenwaPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>

            <logic:equal name="controlBean" property="showRenrakusakiFax" value="true">
              <logic:present name="publicSearchDetailBean" property="renrakusakiFax">　FAX <bean:write name="publicSearchDetailBean" property="renrakusakiFax" /> <logic:present name="publicSearchDetailBean" property="renrakusakiFaxShurui">(<bean:write name="publicSearchDetailBean" property="renrakusakiFaxShurui" />)</logic:present></logic:present>

              <logic:present name="publicSearchDetailBean" property="renrakusakiFaxPub">
                <logic:equal name="publicSearchDetailBean" property="renrakusakiFaxPub" value="＊＊公開不可＊＊">
              　<span class="private"><bean:write name="publicSearchDetailBean" property="renrakusakiFaxPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="renrakusakiFaxPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="renrakusakiFaxPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" rowspan="2" nowrap>勤務先<br>連絡先2</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showSouhusakiJuusho" value="true">
              <logic:present name="publicSearchDetailBean" property="souhusakiYuubinbangou">〒<bean:write name="publicSearchDetailBean" property="souhusakiYuubinbangou" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="souhusakiJuusho">　<bean:write name="publicSearchDetailBean" property="souhusakiJuusho" /></logic:present>
              <bean:write name="publicSearchDetailBean" property="souhusakiMeishou" />
              <logic:present name="publicSearchDetailBean" property="souhusakiJuushoPub">
                <logic:equal name="publicSearchDetailBean" property="souhusakiJuushoPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="souhusakiJuushoPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="souhusakiJuushoPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="souhusakiJuushoPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <logic:equal name="controlBean" property="showSouhusakiDenwa" value="true">
              <logic:present name="publicSearchDetailBean" property="souhusakiDenwa">TEL <bean:write name="publicSearchDetailBean" property="souhusakiDenwa" /> <logic:present name="publicSearchDetailBean" property="souhusakiDenwaShurui">(<bean:write name="publicSearchDetailBean" property="souhusakiDenwaShurui" />)</logic:present></logic:present>
              <logic:present name="publicSearchDetailBean" property="souhusakiDenwaNaisen">（内線 <bean:write name="publicSearchDetailBean" property="souhusakiDenwaNaisen" />）</logic:present>
              <logic:present name="publicSearchDetailBean" property="souhusakiDenwaPub">
                <logic:equal name="publicSearchDetailBean" property="souhusakiDenwaPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="souhusakiDenwaPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="souhusakiDenwaPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="souhusakiDenwaPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            <logic:equal name="controlBean" property="showSouhusakiFax" value="true">
              <logic:present name="publicSearchDetailBean" property="souhusakiFax">　FAX <bean:write name="publicSearchDetailBean" property="souhusakiFax" /> <logic:present name="publicSearchDetailBean" property="souhusakiFaxShurui">(<bean:write name="publicSearchDetailBean" property="souhusakiFaxShurui" />)</logic:present></logic:present>
              <logic:present name="publicSearchDetailBean" property="souhusakiFaxPub">
                <logic:equal name="publicSearchDetailBean" property="souhusakiFaxPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="souhusakiFaxPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="souhusakiFaxPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="souhusakiFaxPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" rowspan="2" nowrap>自宅</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showJitakuJuusho" value="true">
              <logic:present name="publicSearchDetailBean" property="jitakuYuubinbangou">〒<bean:write name="publicSearchDetailBean" property="jitakuYuubinbangou" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="jitakuJuusho">　<bean:write name="publicSearchDetailBean" property="jitakuJuusho" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="jitakuMeishou">　<bean:write name="publicSearchDetailBean" property="jitakuMeishou" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="jitakuJuushoPub">
                <logic:equal name="publicSearchDetailBean" property="jitakuJuushoPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="jitakuJuushoPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="jitakuJuushoPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="jitakuJuushoPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <logic:equal name="controlBean" property="showJitakuDenwa" value="true">
              <logic:present name="publicSearchDetailBean" property="jitakuDenwa">TEL <bean:write name="publicSearchDetailBean" property="jitakuDenwa" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="jitakuDenwaPub">
                <logic:equal name="publicSearchDetailBean" property="jitakuDenwaPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="jitakuDenwaPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="jitakuDenwaPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="jitakuDenwaPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            <logic:equal name="controlBean" property="showJitakuFax" value="true">
              <logic:present name="publicSearchDetailBean" property="jitakuFax">　FAX <bean:write name="publicSearchDetailBean" property="jitakuFax" /></logic:present>
              <logic:present name="publicSearchDetailBean" property="jitakuFaxPub">
                <logic:equal name="publicSearchDetailBean" property="jitakuFaxPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="jitakuFaxPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="jitakuFaxPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="jitakuFaxPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>携帯電話</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showKeitaidenwa" value="true">
              <bean:write name="publicSearchDetailBean" property="keitaidenwa" />
              <logic:present name="publicSearchDetailBean" property="keitaidenwaPub">
                <logic:equal name="publicSearchDetailBean" property="keitaidenwaPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="keitaidenwaPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="keitaidenwaPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="keitaidenwaPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>email</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showEmail" value="true">
              <bean:write name="publicSearchDetailBean" property="email" />
              <logic:present name="publicSearchDetailBean" property="emailPub">
                <logic:equal name="publicSearchDetailBean" property="emailPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="emailPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="emailPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="emailPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>homepage</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showHomepage" value="true">
              <logic:present name="publicSearchDetailBean" property="homepage">
              <logic:iterate id="homepages" name="publicSearchDetailBean" property="homepage">
                <a href="<bean:write name="homepages"/>" target="_blank"><bean:write name="homepages"/></a>&nbsp;&nbsp;
              </logic:iterate>
              </logic:present>
              <logic:present name="publicSearchDetailBean" property="homepagePub">
                <logic:equal name="publicSearchDetailBean" property="homepagePub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="homepagePub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="homepagePub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="homepagePub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>学歴</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showGakureki" value="true">
              <bean:write name="publicSearchDetailBean" property="gakureki" />
              <logic:present name="publicSearchDetailBean" property="gakurekiPub">
                <logic:equal name="publicSearchDetailBean" property="gakurekiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="gakurekiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="gakurekiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="gakurekiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
    
        <tr>
          <th class="caption" nowrap>学位・資格</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showGakui" value="true">
              <bean:write name="publicSearchDetailBean" property="gakui" />
              <logic:present name="publicSearchDetailBean" property="gakuiPub">
                <logic:equal name="publicSearchDetailBean" property="gakuiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="gakuiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="gakuiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="gakuiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>専門分野</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showSenmonBunnya" value="true">
              <bean:write name="publicSearchDetailBean" property="senmonBunya" />
              <logic:present name="publicSearchDetailBean" property="senmonBunyaPub">
                <logic:equal name="publicSearchDetailBean" property="senmonBunyaPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="senmonBunyaPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="senmonBunyaPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="senmonBunyaPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>経歴</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showKeireki" value="true">
              <bean:write name="publicSearchDetailBean" property="keireki" />
              <logic:present name="publicSearchDetailBean" property="keirekiPub">
                <logic:equal name="publicSearchDetailBean" property="keirekiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="keirekiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="keirekiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="keirekiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>業績</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showGyouseki" value="true">
              <bean:write name="publicSearchDetailBean" property="gyouseki" />
              <logic:present name="publicSearchDetailBean" property="gyousekiPub">
                <logic:equal name="publicSearchDetailBean" property="gyousekiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="gyousekiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="gyousekiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="gyousekiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>受賞・入選</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showJushou" value="true">
              <bean:write name="publicSearchDetailBean" property="jushou" />
              <logic:present name="publicSearchDetailBean" property="jushouPub">
                <logic:equal name="publicSearchDetailBean" property="jushouPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="jushouPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="jushouPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="jushouPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap="nowrap">★朝日新聞<br>との関係<br><font size="1">【各紙掲載情報<br>の更新は07年<br>01月末に休止】</font></th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showTaiAsahiShinbun" value="true">
              <asahi:writeBr name="publicSearchDetailBean" property="taiAsahiShinbun" />
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>趣味</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showShumi" value="true">
              <bean:write name="publicSearchDetailBean" property="shumi" />
              <logic:present name="publicSearchDetailBean" property="shumiPub">
                <logic:equal name="publicSearchDetailBean" property="shumiPub" value="＊＊公開不可＊＊">
                　<span class="private"><bean:write name="publicSearchDetailBean" property="shumiPub" /></span>
                </logic:equal>
                <logic:equal name="publicSearchDetailBean" property="shumiPub" value="＊＊削除希望＊＊">
                　<span class="delete"><bean:write name="publicSearchDetailBean" property="shumiPub" /></span>
                </logic:equal>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="caption" nowrap>備考</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showBikou" value="true">

              <logic:present name="publicSearchDetailBean" property="bikou">
                <bean:write name="publicSearchDetailBean" property="bikou" />&nbsp;<span class="private">＊＊公開不可＊＊</span>
              </logic:present>
            </logic:equal>
            &nbsp;
          </td>
        </tr>
<%-- 2012-11-07 朝日人物事典を削除 --%>
        <tr>
          <th class="caption" nowrap>分野コード</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showClassCode" value="true">
              <bean:write name="publicSearchDetailBean" property="classCode" />
            </logic:equal>
            &nbsp;
          </td>
        </tr>

        <tr>
          <th class="subCaption" nowrap>更新履歴</th>
          <td colspan="4">
            <logic:equal name="controlBean" property="showUpdateHistory" value="true">
              <bean:write name="publicSearchDetailBean" property="updateHistory" />
            </logic:equal>
            &nbsp;
          </td>
        </tr>

      </table>

    </td>
  </tr>

  <tr><td><br></td></tr>

  <tr>
    <td colspan="3">
      <form name="bottomButtons" id="3">
      <asahi:forwardButton action="/publicSearchResult" function="invokeAction" form="bottomButtons" value="　一覧表示画面へ　" style="buttonAll" />
      　　<asahi:forwardButton action="/publicSearchInput" function="invokeAction" form="bottomButtons" value="検索条件入力画面へ" style="buttonAll" />
      <html:hidden property="search" value="false" />
      </form>
    </td>
  </tr>

</table>
<br>

<%@ include file="/jsp/custom/public_search_footer.html" %>

<br><br><br>
<jsp:include page="../snoop.jsp"/>
</body>
</html:html>
