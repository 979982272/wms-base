(function(B){if(!Array.indexOf){Array.prototype.indexOf=function(D){for(var C=0;C<this.length;C++){if(this[C]==D){return C}}return -1}}var A={init:function(D){var C=this;if(!C.data("jqv")||C.data("jqv")==null){D=A._saveOptions(C,D);B(document).on("click",".formError",function(){B(this).fadeOut(150,function(){B(this).parent(".formErrorOuter").remove();B(this).remove()})})}return this},attach:function(E){var C=this;var D;if(E){D=A._saveOptions(C,E)}else{D=C.data("jqv")}D.validateAttribute=(C.find("[data-validation-engine*=validate]").length)?"data-validation-engine":"class";if(D.binded){C.on(D.validationEventTrigger,"["+D.validateAttribute+"*=validate]:not([type=checkbox]):not([type=radio]):not(.datepicker)",A._onFieldEvent);C.on("click","["+D.validateAttribute+"*=validate][type=checkbox],["+D.validateAttribute+"*=validate][type=radio]",A._onFieldEvent);C.on(D.validationEventTrigger,"["+D.validateAttribute+"*=validate][class*=datepicker]",{"delay":300},A._onFieldEvent)}if(D.autoPositionUpdate){B(window).bind("resize",{"noAnimation":true,"formElem":C},A.updatePromptsPosition)}C.on("click","a[data-validation-engine-skip], a[class*='validate-skip'], button[data-validation-engine-skip], button[class*='validate-skip'], input[data-validation-engine-skip], input[class*='validate-skip']",A._submitButtonClick);C.removeData("jqv_submitButton");C.on("submit",A._onSubmitEvent);return this},detach:function(){var C=this;var D=C.data("jqv");C.find("["+D.validateAttribute+"*=validate]").not("[type=checkbox]").off(D.validationEventTrigger,A._onFieldEvent);C.find("["+D.validateAttribute+"*=validate][type=checkbox],[class*=validate][type=radio]").off("click",A._onFieldEvent);C.off("submit",A._onSubmitEvent);C.removeData("jqv");C.off("click","a[data-validation-engine-skip], a[class*='validate-skip'], button[data-validation-engine-skip], button[class*='validate-skip'], input[data-validation-engine-skip], input[class*='validate-skip']",A._submitButtonClick);C.removeData("jqv_submitButton");if(D.autoPositionUpdate){B(window).off("resize",A.updatePromptsPosition)}return this},validate:function(){var F=B(this);var E=null;if(F.is("form")||F.hasClass("validationEngineContainer")){if(F.hasClass("validating")){return false}else{F.addClass("validating");var D=F.data("jqv");var E=A._validateFields(this);setTimeout(function(){F.removeClass("validating")},100);if(E&&D.onSuccess){D.onSuccess()}else{if(!E&&D.onFailure){D.onFailure()}}}}else{if(F.is("form")||F.hasClass("validationEngineContainer")){F.removeClass("validating")}else{var C=F.closest("form, .validationEngineContainer"),D=(C.data("jqv"))?C.data("jqv"):B.validationEngine.defaults,E=A._validateField(F,D);if(E&&D.onFieldSuccess){D.onFieldSuccess()}else{if(D.onFieldFailure&&D.InvalidFields.length>0){D.onFieldFailure()}}}}if(D.onValidationComplete){return !!D.onValidationComplete(C,E)}return E},updatePromptsPosition:function(F){if(F&&this==window){var D=F.data.formElem;var C=F.data.noAnimation}else{var D=B(this.closest("form, .validationEngineContainer"))}var E=D.data("jqv");D.find("["+E.validateAttribute+"*=validate]").not(":disabled").each(function(){var I=B(this);if(E.prettySelect&&I.is(":hidden")){I=D.find("#"+E.usePrefix+I.attr("id")+E.useSuffix)}var G=A._getPrompt(I);var H=B(G).find(".formErrorContent").html();if(G){A._updatePrompt(I,B(G),H,undefined,false,E,C)}});return this},showPrompt:function(E,C,D,G){var H=this.closest("form, .validationEngineContainer");var F=H.data("jqv");if(!F){F=A._saveOptions(this,F)}if(D){F.promptPosition=D}F.showArrow=G==true;A._showPrompt(this,E,C,false,F);return this},hide:function(){var C=B(this).closest("form, .validationEngineContainer");var D=C.data("jqv");var F=(D&&D.fadeDuration)?D.fadeDuration:0.3;var E;if(B(this).is("form")||B(this).hasClass("validationEngineContainer")){E="parentForm"+A._getClassName(B(this).attr("id"))}else{E=A._getClassName(B(this).attr("id"))+"formError"}B("."+E).fadeTo(F,0.3,function(){B(this).parent(".formErrorOuter").remove();B(this).remove()});return this},hideAll:function(){var C=this;var D=C.data("jqv");var E=D?D.fadeDuration:300;B(".formError").fadeTo(E,300,function(){B(this).parent(".formErrorOuter").remove();B(this).remove()});return this},_onFieldEvent:function(E){var F=B(this);var C=F.closest("form, .validationEngineContainer");var D=C.data("jqv");D.eventTrigger="field";window.setTimeout(function(){A._validateField(F,D);if(D.InvalidFields.length==0&&D.onFieldSuccess){D.onFieldSuccess()}else{if(D.InvalidFields.length>0&&D.onFieldFailure){D.onFieldFailure()}}},(E.data)?E.data.delay:0)},_onSubmitEvent:function(){var D=B(this);var E=D.data("jqv");if(D.data("jqv_submitButton")){var F=B("#"+D.data("jqv_submitButton"));if(F){if(F.length>0){if(F.hasClass("validate-skip")||F.attr("data-validation-engine-skip")=="true"){return true}}}}E.eventTrigger="submit";var C=A._validateFields(D);if(C&&E.ajaxFormValidation){A._validateFormWithAjax(D,E);return false}if(E.onValidationComplete){return !!E.onValidationComplete(D,C)}return C},_checkAjaxStatus:function(C){var D=true;B.each(C.ajaxValidCache,function(E,F){if(!F){D=false;return false}});return D},_checkAjaxFieldStatus:function(D,C){return C.ajaxValidCache[D]==true},_validateFields:function(D){var H=D.data("jqv");var M=false;D.trigger("jqv.form.validating");var F=null;D.find("["+H.validateAttribute+"*=validate]").not(":disabled").not("span").each(function(){var O=B(this);var P=[];if(B.inArray(O.attr("name"),P)<0){M|=A._validateField(O,H);if(M&&F==null){if(O.is(":hidden")&&H.prettySelect){F=O=D.find("#"+H.usePrefix+A._jqSelector(O.attr("id"))+H.useSuffix)}else{if(O.data("jqv-prompt-at") instanceof jQuery){O=O.data("jqv-prompt-at")}else{if(O.data("jqv-prompt-at")){O=B(O.data("jqv-prompt-at"))}}F=O}}if(H.doNotShowAllErrosOnSubmit){return false}P.push(O.attr("name"));if(H.showOneMessage==true&&M){return false}}});D.trigger("jqv.form.result",[M]);if(M){if(H.scroll){var N=F.offset().top;var I=F.offset().left;var E=H.promptPosition;if(typeof(E)=="string"&&E.indexOf(":")!=-1){E=E.substring(0,E.indexOf(":"))}if(E!="bottomRight"&&E!="bottomLeft"){var K=A._getPrompt(F);if(K){N=K.offset().top}}if(H.scrollOffset){N-=H.scrollOffset}if(H.isOverflown){var J=B(H.overflownDIV);if(!J.length){return false}var L=J.scrollTop();var C=-parseInt(J.offset().top);N+=L+C-5;var G=B(H.overflownDIV+":not(:animated)");G.animate({scrollTop:N},1100,function(){if(H.focusFirstField){F.focus()}})}else{B("html, body").animate({scrollTop:N},1100,function(){if(H.focusFirstField){F.focus()}});B("html, body").animate({scrollLeft:I},1100)}}else{if(H.focusFirstField){F.focus()}}return false}return true},_validateFormWithAjax:function(E,F){var H=E.serialize();var C=(F.ajaxFormValidationMethod)?F.ajaxFormValidationMethod:"GET";var D=(F.ajaxFormValidationURL)?F.ajaxFormValidationURL:E.attr("action");var G=(F.dataType)?F.dataType:"json";B.ajax({type:C,url:D,cache:false,dataType:G,data:H,form:E,methods:A,options:F,beforeSend:function(){return F.onBeforeAjaxFormValidation(E,F)},error:function(J,I){if(F.onFailure){F.onFailure(J,I)}else{A._ajaxError(J,I)}},success:function(J){if((G=="json")&&(J!==true)){var O=false;for(var N=0;N<J.length;N++){var M=J[N];var P=M[0];var I=B(B("#"+P)[0]);if(I.length==1){var K=M[2];if(M[1]==true){if(K==""||!K){A._closePrompt(I)}else{if(F.allrules[K]){var L=F.allrules[K].alertTextOk;if(L){K=L}}if(F.showPrompts){A._showPrompt(I,K,"pass",false,F,true)}}}else{O|=true;if(F.allrules[K]){var L=F.allrules[K].alertText;if(L){K=L}}if(F.showPrompts){A._showPrompt(I,K,"",false,F,true)}}}}F.onAjaxFormComplete(!O,E,J,F)}else{F.onAjaxFormComplete(true,E,J,F)}}})},_validateField:function(E,U,W){if(!E.attr("id")){E.attr("id","form-validation-field-"+B.validationEngine.fieldIdCounter);++B.validationEngine.fieldIdCounter}if(!U.validateNonVisibleFields){if((E.is(":hidden")&&!U.prettySelect||E.parent().is(":hidden"))&&E.attr("data-role")!="dropdownlist"&&E.attr("data-role")!="combobox"&&E.attr("data-role")!="datepicker"){return false}}var N=E.attr(U.validateAttribute);var L=/validate\[(.*)\]/.exec(N);if(!L){return false}var C=L[1];var R=C.split(/\[|,|\]/);var H=false;var I=E.attr("name");var S="";var F="";var P=false;var G=false;U.isError=false;U.showArrow=true;if(U.maxErrorsPerField>0){G=true}var V=B(E.closest("form, .validationEngineContainer"));for(var K=0;K<R.length;K++){R[K]=R[K].replace(" ","");if(R[K]===""){delete R[K]}}for(var K=0,J=0;K<R.length;K++){if(G&&J>=U.maxErrorsPerField){if(!P){var Y=B.inArray("required",R);P=(Y!=-1&&Y>=K)}break}var M=undefined;switch(R[K]){case"required":P=true;M=A._getErrorMessage(V,E,R[K],R,K,U,A._required);break;case"custom":M=A._getErrorMessage(V,E,R[K],R,K,U,A._custom);break;case"groupRequired":var Z="["+U.validateAttribute+"*="+R[K+1]+"]";var Q=V.find(Z).eq(0);if(Q[0]!=E[0]){A._validateField(Q,U,W);U.showArrow=true}M=A._getErrorMessage(V,E,R[K],R,K,U,A._groupRequired);if(M){P=true}U.showArrow=false;break;case"ajax":M=A._ajax(E,R,K,U);if(M){F="load"}break;case"minSize":M=A._getErrorMessage(V,E,R[K],R,K,U,A._minSize);break;case"maxSize":M=A._getErrorMessage(V,E,R[K],R,K,U,A._maxSize);break;case"min":M=A._getErrorMessage(V,E,R[K],R,K,U,A._min);break;case"max":M=A._getErrorMessage(V,E,R[K],R,K,U,A._max);break;case"past":M=A._getErrorMessage(V,E,R[K],R,K,U,A._past);break;case"future":M=A._getErrorMessage(V,E,R[K],R,K,U,A._future);break;case"dateRange":var Z="["+U.validateAttribute+"*="+R[K+1]+"]";U.firstOfGroup=V.find(Z).eq(0);U.secondOfGroup=V.find(Z).eq(1);if(U.firstOfGroup[0].value||U.secondOfGroup[0].value){M=A._getErrorMessage(V,E,R[K],R,K,U,A._dateRange)}if(M){P=true}U.showArrow=false;break;case"dateTimeRange":var Z="["+U.validateAttribute+"*="+R[K+1]+"]";U.firstOfGroup=V.find(Z).eq(0);U.secondOfGroup=V.find(Z).eq(1);if(U.firstOfGroup[0].value||U.secondOfGroup[0].value){M=A._getErrorMessage(V,E,R[K],R,K,U,A._dateTimeRange)}if(M){P=true}U.showArrow=false;break;case"maxCheckbox":E=B(V.find("input[name='"+I+"']"));M=A._getErrorMessage(V,E,R[K],R,K,U,A._maxCheckbox);break;case"minCheckbox":E=B(V.find("input[name='"+I+"']"));M=A._getErrorMessage(V,E,R[K],R,K,U,A._minCheckbox);break;case"equals":M=A._getErrorMessage(V,E,R[K],R,K,U,A._equals);break;case"funcCall":M=A._getErrorMessage(V,E,R[K],R,K,U,A._funcCall);break;case"creditCard":M=A._getErrorMessage(V,E,R[K],R,K,U,A._creditCard);break;case"condRequired":M=A._getErrorMessage(V,E,R[K],R,K,U,A._condRequired);if(M!==undefined){P=true}break;default:}var O=false;if(typeof M=="object"){switch(M.status){case"_break":O=true;break;case"_error":M=M.message;break;case"_error_no_prompt":return true;break;default:break}}if(O){break}if(typeof M=="string"){S+=M+"<br/>";U.isError=true;J++}}if(!P&&!(E.val())&&E.val().length<1&&R.indexOf("equals")<0){U.isError=false}var X=E.prop("type");var D=E.data("promptPosition")||U.promptPosition;if((X=="radio"||X=="checkbox")&&V.find("input[name='"+I+"']").size()>1){if(D==="inline"){E=B(V.find("input[name='"+I+"'][type!=hidden]:last"))}else{E=B(V.find("input[name='"+I+"'][type!=hidden]:first"))}U.showArrow=false}if(E.is(":hidden")&&U.prettySelect){E=V.find("#"+U.usePrefix+A._jqSelector(E.attr("id"))+U.useSuffix)}if(U.isError&&U.showPrompts){A._showPrompt(E,S,F,false,U)}else{if(!H){A._closePrompt(E)}}if(!H){E.trigger("jqv.field.result",[E,U.isError,S])}var T=B.inArray(E[0],U.InvalidFields);if(T==-1){if(U.isError){U.InvalidFields.push(E[0])}}else{if(!U.isError){U.InvalidFields.splice(T,1)}}A._handleStatusCssClasses(E,U);if(U.isError&&U.onFieldFailure){U.onFieldFailure(E)}if(!U.isError&&U.onFieldSuccess){U.onFieldSuccess(E)}return U.isError},_handleStatusCssClasses:function(D,C){if(C.addSuccessCssClassToField){D.removeClass(C.addSuccessCssClassToField)}if(C.addFailureCssClassToField){D.removeClass(C.addFailureCssClassToField)}if(C.addSuccessCssClassToField&&!C.isError){D.addClass(C.addSuccessCssClassToField)}if(C.addFailureCssClassToField&&C.isError){D.addClass(C.addFailureCssClassToField)}},_getErrorMessage:function(E,L,K,H,J,I,F){var M=jQuery.inArray(K,H);if(K==="custom"||K==="funcCall"){var C=H[M+1];K=K+"["+C+"]";delete (H[M])}var O=K;var N=(L.attr("data-validation-engine"))?L.attr("data-validation-engine"):L.attr("class");var D=N.split(" ");var P;if(K=="future"||K=="past"||K=="maxCheckbox"||K=="minCheckbox"){P=F(E,L,H,J,I)}else{P=F(L,H,J,I)}if(P!=undefined){var G=A._getCustomErrorMessage(B(L),D,O,I);if(G){P=G}}return P},_getCustomErrorMessage:function(G,C,F,D){var K=false;var I=/^custom\[.*\]$/.test(F)?A._validityProp["custom"]:A._validityProp[F];if(I!=undefined){K=G.attr("data-errormessage-"+I);if(K!=undefined){return K}}K=G.attr("data-errormessage");if(K!=undefined){return K}var H="#"+G.attr("id");if(typeof D.custom_error_messages[H]!="undefined"&&typeof D.custom_error_messages[H][F]!="undefined"){K=D.custom_error_messages[H][F]["message"]}else{if(C.length>0){for(var E=0;E<C.length&&C.length>0;E++){var J="."+C[E];if(typeof D.custom_error_messages[J]!="undefined"&&typeof D.custom_error_messages[J][F]!="undefined"){K=D.custom_error_messages[J][F]["message"];break}}}}if(!K&&typeof D.custom_error_messages[F]!="undefined"&&typeof D.custom_error_messages[F]["message"]!="undefined"){K=D.custom_error_messages[F]["message"]}return K},_validityProp:{"required":"value-missing","custom":"custom-error","groupRequired":"value-missing","ajax":"custom-error","minSize":"range-underflow","maxSize":"range-overflow","min":"range-underflow","max":"range-overflow","past":"type-mismatch","future":"type-mismatch","dateRange":"type-mismatch","dateTimeRange":"type-mismatch","maxCheckbox":"range-overflow","minCheckbox":"range-underflow","equals":"pattern-mismatch","funcCall":"custom-error","creditCard":"pattern-mismatch","condRequired":"value-missing"},_required:function(J,G,I,H,D){switch(J.prop("type")){case"text":case"password":case"textarea":case"file":case"select-one":case"select-multiple":default:var K=B.trim(J.val());var L=B.trim(J.attr("data-validation-placeholder"));var C=B.trim(J.attr("placeholder"));if((!K)||(L&&K==L)||(C&&K==C)){return H.allrules[G[I]].alertText}break;case"radio":case"checkbox":if(D){if(!J.attr("checked")){return H.allrules[G[I]].alertTextCheckboxMultiple}break}var E=J.closest("form, .validationEngineContainer");var F=J.attr("name");if(E.find("input[name='"+F+"']:checked").size()==0){if(E.find("input[name='"+F+"']:visible").size()==1){return H.allrules[G[I]].alertTextCheckboxe}else{return H.allrules[G[I]].alertTextCheckboxMultiple}}break}},_groupRequired:function(G,E,D,F){var C="["+F.validateAttribute+"*="+E[D+1]+"]";var H=false;G.closest("form, .validationEngineContainer").find(C).each(function(){if(!A._required(B(this),E,D,F)){H=true;return false}});if(!H){return F.allrules[E[D]].alertText}},_custom:function(I,D,G,F){var E=D[G+1];var H=F.allrules[E];var J;if(!H){alert("jqv:custom rule not found - "+E);return}if(H["regex"]){var K=H.regex;if(!K){alert("jqv:custom regex not found - "+E);return}var C=new RegExp(K);if(!C.test(I.val())){return F.allrules[E].alertText}}else{if(H["func"]){J=H["func"];if(typeof(J)!=="function"){alert("jqv:custom parameter 'function' is no function - "+E);return}if(!J(I,D,G,F)){return F.allrules[E].alertText}}else{alert("jqv:custom type not allowed "+E);return}}},_funcCall:function(I,E,H,G){var F=E[H+1];var J;if(F.indexOf(".")>-1){var C=F.split(".");var D=window;while(C.length){D=D[C.shift()]}J=D}else{J=window[F]||G.customFunctions[F]}if(typeof(J)=="function"){return J(I,E,H,G)}},_equals:function(F,D,C,E){var G=D[C+1];if(F.val()!=B("#"+G).val()){return E.allrules.equals.alertText}},_maxSize:function(H,E,C,F){var I=E[C+1];var G=H.val().length;if(G>I){var D=F.allrules.maxSize;return D.alertText+I+D.alertText2}},_minSize:function(I,F,D,G){var C=F[D+1];var H=I.val().length;if(H<C){var E=G.allrules.minSize;return E.alertText+C+E.alertText2}},_min:function(I,F,D,G){var C=parseFloat(F[D+1]);var H=parseFloat(I.val());if(H<C){var E=G.allrules.min;if(E.alertText2){return E.alertText+C+E.alertText2}return E.alertText+C}},_max:function(H,E,C,F){var I=parseFloat(E[C+1]);var G=parseFloat(H.val());if(G>I){var D=F.allrules.max;if(D.alertText2){return D.alertText+I+D.alertText2}return D.alertText+I}},_past:function(K,I,E,G,F){var D=E[G+1];var L=B(K.find("*[name='"+D.replace(/^#+/,"")+"']"));var C;if(D.toLowerCase()=="now"){C=new Date()}else{if(undefined!=L.val()){if(L.is(":disabled")){return}C=A._parseDate(L.val())}else{C=A._parseDate(D)}}var J=A._parseDate(I.val());if(J>C){var H=F.allrules.past;if(H.alertText2){return H.alertText+A._dateToString(C)+H.alertText2}return H.alertText+A._dateToString(C)}},_future:function(K,I,E,G,F){var D=E[G+1];var L=B(K.find("*[name='"+D.replace(/^#+/,"")+"']"));var C;if(D.toLowerCase()=="now"){C=new Date()}else{if(undefined!=L.val()){if(L.is(":disabled")){return}C=A._parseDate(L.val())}else{C=A._parseDate(D)}}var J=A._parseDate(I.val());if(J<C){var H=F.allrules.future;if(H.alertText2){return H.alertText+A._dateToString(C)+H.alertText2}return H.alertText+A._dateToString(C)}},_isDate:function(C){var D=new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/);return D.test(C)},_isDateTime:function(D){var C=new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/);return C.test(D)},_dateCompare:function(D,C){return(new Date(D.toString())<new Date(C.toString()))},_dateRange:function(F,D,C,E){if((!E.firstOfGroup[0].value&&E.secondOfGroup[0].value)||(E.firstOfGroup[0].value&&!E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}if(!A._isDate(E.firstOfGroup[0].value)||!A._isDate(E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}if(!A._dateCompare(E.firstOfGroup[0].value,E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}},_dateTimeRange:function(F,D,C,E){if((!E.firstOfGroup[0].value&&E.secondOfGroup[0].value)||(E.firstOfGroup[0].value&&!E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}if(!A._isDateTime(E.firstOfGroup[0].value)||!A._isDateTime(E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}if(!A._dateCompare(E.firstOfGroup[0].value,E.secondOfGroup[0].value)){return E.allrules[D[C]].alertText+E.allrules[D[C]].alertText2}},_maxCheckbox:function(C,H,E,G,F){var I=E[G+1];var J=H.attr("name");var D=C.find("input[name='"+J+"']:checked").size();if(D>I){F.showArrow=false;if(F.allrules.maxCheckbox.alertText2){return F.allrules.maxCheckbox.alertText+" "+I+" "+F.allrules.maxCheckbox.alertText2}return F.allrules.maxCheckbox.alertText}},_minCheckbox:function(C,H,E,G,F){var I=E[G+1];var J=H.attr("name");var D=C.find("input[name='"+J+"']:checked").size();if(D<I){F.showArrow=false;return F.allrules.minCheckbox.alertText+" "+I+" "+F.allrules.minCheckbox.alertText2}},_creditCard:function(J,G,I,H){var D=false,L=J.val().replace(/ +/g,"").replace(/-+/g,"");var E=L.length;if(E>=14&&E<=16&&parseInt(L)>0){var M=0,I=E-1,K=1,C,F=new String();do{C=parseInt(L.charAt(I));F+=(K++%2==0)?C*2:C}while(--I>=0);for(I=0;I<F.length;I++){M+=parseInt(F.charAt(I))}D=M%10==0}if(!D){return H.allrules.creditCard.alertText}},_ajax:function(K,G,I,H){var D=G[I+1];var J=H.allrules[D];var L=J.extraData;var E=J.extraDataDynamic;var F={"fieldId":K.attr("id"),"fieldValue":K.val()};if(typeof L==="object"){B.extend(F,L)}else{if(typeof L==="string"){var C=L.split("&");for(var I=0;I<C.length;I++){var N=C[I].split("=");if(N[0]&&N[0]){F[N[0]]=N[1]}}}}if(E){var O=[];var M=String(E).split(",");for(var I=0;I<M.length;I++){var Q=M[I];if(B(Q).length){var P=K.closest("form, .validationEngineContainer").find(Q).val();var R=Q.replace("#","")+"="+escape(P);F[Q.replace("#","")]=P}}}if(H.eventTrigger=="field"){delete (H.ajaxValidCache[K.attr("id")])}if(!H.isError&&!A._checkAjaxFieldStatus(K.attr("id"),H)){B.ajax({type:H.ajaxFormValidationMethod,url:J.url,cache:false,dataType:"json",data:F,field:K,rule:J,methods:A,options:H,beforeSend:function(){},error:function(T,S){if(H.onFailure){H.onFailure(T,S)}else{A._ajaxError(T,S)}},success:function(T){var W=T[0];var X=B("#"+W).eq(0);if(X.length==1){var U=T[1];var S=T[2];if(!U){H.ajaxValidCache[W]=false;H.isError=true;if(S){if(H.allrules[S]){var V=H.allrules[S].alertText;if(V){S=V}}}else{S=J.alertText}if(H.showPrompts){A._showPrompt(X,S,"",true,H)}}else{H.ajaxValidCache[W]=true;if(S){if(H.allrules[S]){var V=H.allrules[S].alertTextOk;if(V){S=V}}}else{S=J.alertTextOk}if(H.showPrompts){if(S){A._showPrompt(X,S,"pass",true,H)}else{A._closePrompt(X)}}if(H.eventTrigger=="submit"){K.closest("form").submit()}}}X.trigger("jqv.field.result",[X,H.isError,S])}});return J.alertTextLoad}},_ajaxError:function(D,C){if(D.status==0&&C==null){alert("The page is not served from a server! ajax call failed")}else{if(typeof console!="undefined"){console.log("Ajax error: "+D.status+" "+C)}}},_dateToString:function(C){return C.getFullYear()+"-"+(C.getMonth()+1)+"-"+C.getDate()},_parseDate:function(D){var C=D.split("-");if(C==D){C=D.split("/")}if(C==D){C=D.split(".");return new Date(C[2],(C[1]-1),C[0])}return new Date(C[0],(C[1]-1),C[2])},_showPrompt:function(G,D,C,I,E,H){if(G.data("jqv-prompt-at") instanceof jQuery){G=G.data("jqv-prompt-at")}else{if(G.data("jqv-prompt-at")){G=B(G.data("jqv-prompt-at"))}}var F=A._getPrompt(G);if(H){F=false}if(B.trim(D)){if(F){A._updatePrompt(G,F,D,C,I,E)}else{A._buildPrompt(G,D,C,I,E)}}},_buildPrompt:function(C,D,G,I,H){var L=B("<div>");L.addClass(A._getClassName(C.attr("id"))+"formError");L.addClass("parentForm"+A._getClassName(C.closest("form, .validationEngineContainer").attr("id")));L.addClass("formError");switch(G){case"pass":L.addClass("greenPopup");break;case"load":L.addClass("blackPopup");break;default:}if(I){L.addClass("ajaxed")}var E=B("<div>").addClass("formErrorContent").html(D).appendTo(L);var K=C.data("promptPosition")||H.promptPosition;if(H.showArrow){var N=B("<div>").addClass("formErrorArrow");if(typeof(K)=="string"){var J=K.indexOf(":");if(J!=-1){K=K.substring(0,J)}}switch(K){case"bottomLeft":case"bottomRight":L.find(".formErrorContent").before(N);N.addClass("formErrorArrowBottom").html('<div class="line1"><!-- --></div><div class="line2"><!-- --></div><div class="line3"><!-- --></div><div class="line4"><!-- --></div><div class="line5"><!-- --></div><div class="line6"><!-- --></div><div class="line7"><!-- --></div><div class="line8"><!-- --></div><div class="line9"><!-- --></div><div class="line10"><!-- --></div>');break;case"topLeft":case"topRight":N.html('<div class="line10"><!-- --></div><div class="line9"><!-- --></div><div class="line8"><!-- --></div><div class="line7"><!-- --></div><div class="line6"><!-- --></div><div class="line5"><!-- --></div><div class="line4"><!-- --></div><div class="line3"><!-- --></div><div class="line2"><!-- --></div><div class="line1"><!-- --></div>');L.append(N);break}}if(H.addPromptClass){L.addClass(H.addPromptClass)}var M=C.attr("data-required-class");if(M!==undefined){L.addClass(M)}else{if(H.prettySelect){if(B("#"+C.attr("id")).next().is("select")){var F=B("#"+C.attr("id").substr(H.usePrefix.length).substring(H.useSuffix.length)).attr("data-required-class");if(F!==undefined){L.addClass(F)}}}}L.css({"opacity":0});if(K==="inline"){L.addClass("inline");if(typeof C.attr("data-prompt-target")!=="undefined"&&B("#"+C.attr("data-prompt-target")).length>0){L.appendTo(B("#"+C.attr("data-prompt-target")))}else{C.after(L)}}else{C.before(L)}var J=A._calculatePosition(C,L,H);L.css({"position":K==="inline"?"relative":"absolute","top":J.callerTopPosition,"left":J.callerleftPosition,"marginTop":J.marginTopSize,"opacity":0}).data("callerField",C);if(H.autoHidePrompt){setTimeout(function(){L.animate({"opacity":0},function(){L.closest(".formErrorOuter").remove();L.remove()})},H.autoHideDelay)}return L.animate({"opacity":0.87})},_updatePrompt:function(C,D,E,K,I,H,F){if(D){if(typeof K!=="undefined"){if(K=="pass"){D.addClass("greenPopup")}else{D.removeClass("greenPopup")}if(K=="load"){D.addClass("blackPopup")}else{D.removeClass("blackPopup")}}if(I){D.addClass("ajaxed")}else{D.removeClass("ajaxed")}D.find(".formErrorContent").html(E);var J=A._calculatePosition(C,D,H);var G={"top":J.callerTopPosition,"left":J.callerleftPosition,"marginTop":J.marginTopSize};if(F){D.css(G)}else{D.animate(G)}}},_closePrompt:function(D){var C=A._getPrompt(D);if(C){C.fadeTo("fast",0,function(){C.parent(".formErrorOuter").remove();C.remove()})}},closePrompt:function(C){return A._closePrompt(C)},_getPrompt:function(F){var D=B(F).closest("form, .validationEngineContainer").attr("id");var C=A._getClassName(F.attr("id"))+"formError";var E=B("."+A._escapeExpression(C)+".parentForm"+A._getClassName(D))[0];if(E){return B(E)}},_escapeExpression:function(C){return C.replace(/([#;&,\.\+\*\~':"\!\^$\[\]\(\)=>\|])/g,"\\$1")},isRTL:function(E){var D=B(document);var F=B("body");var C=(E&&E.hasClass("rtl"))||(E&&(E.attr("dir")||"").toLowerCase()==="rtl")||D.hasClass("rtl")||(D.attr("dir")||"").toLowerCase()==="rtl"||F.hasClass("rtl")||(F.attr("dir")||"").toLowerCase()==="rtl";return Boolean(C)},_calculatePosition:function(K,Q,J){var H,M,I;var P=K.width();var R=K.position().left;var O=K.position().top;var N=K.height();var G=Q.height();H=M=0;I=-G;var D=K.data("promptPosition")||J.promptPosition;var C="";var L="";var F=0;var E=0;if(typeof(D)=="string"){if(D.indexOf(":")!=-1){C=D.substring(D.indexOf(":")+1);D=D.substring(0,D.indexOf(":"));if(C.indexOf(",")!=-1){L=C.substring(C.indexOf(",")+1);C=C.substring(0,C.indexOf(","));E=parseInt(L);if(isNaN(E)){E=0}}F=parseInt(C);if(isNaN(C)){C=0}}}switch(D){default:case"topRight":M+=R+P-30;H+=O;break;case"topLeft":H+=O;M+=R;break;case"centerRight":H=O;I=0;M=R+K.outerWidth(true)+5;break;case"centerLeft":M=R-(Q.outerWidth());H=O;I=0;break;case"bottomLeft":H=O+K.outerHeight();I=0;M=R;break;case"bottomRight":M=R+P-30;H=O+K.outerHeight();I=0;break;case"inline":M=0;H=0;I=0}M+=F;H+=E;return{"callerTopPosition":H+"px","callerleftPosition":M+"px","marginTopSize":I+"px"}},_saveOptions:function(C,D){if(B.validationEngineLanguage){var E=B.validationEngineLanguage.allRules}else{B.error("jQuery.validationEngine rules are not loaded, plz add localization files to the page")}B.validationEngine.defaults.allrules=E;var F=B.extend(true,{},B.validationEngine.defaults,D);C.data("jqv",F);return F},_getClassName:function(C){if(C){return C.replace(/:/g,"_").replace(/\./g,"_")}},_jqSelector:function(C){return C.replace(/([;&,\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g,"\\$1")},_condRequired:function(G,D,C,E){var H,F;for(H=(C+1);H<D.length;H++){F=jQuery("#"+D[H]).first();if(F.length&&A._required(F,["required"],0,E,true)==undefined){return A._required(G,["required"],0,E)}}},_submitButtonClick:function(E){var C=B(this);var D=C.closest("form, .validationEngineContainer");D.data("jqv_submitButton",C.attr("id"))}};B.fn.validationEngine=function(D){var C=B(this);if(!C[0]){return C}if(typeof(D)=="string"&&D.charAt(0)!="_"&&A[D]){if(D!="showPrompt"&&D!="hide"&&D!="hideAll"){A.init.apply(C)}return A[D].apply(C,Array.prototype.slice.call(arguments,1))}else{if(typeof D=="object"||!D){A.init.apply(C,arguments);return A.attach.apply(C)}else{B.error("Method "+D+" does not exist in jQuery.validationEngine")}}};B.validationEngine={fieldIdCounter:0,defaults:{validationEventTrigger:"blur",scroll:true,focusFirstField:true,showPrompts:true,validateNonVisibleFields:false,promptPosition:"bottomRight",bindMethod:"bind",inlineAjax:false,ajaxFormValidation:false,ajaxFormValidationURL:false,ajaxFormValidationMethod:"get",onAjaxFormComplete:B.noop,onBeforeAjaxFormValidation:B.noop,onValidationComplete:false,doNotShowAllErrosOnSubmit:false,custom_error_messages:{},binded:false,showArrow:true,isError:false,maxErrorsPerField:false,ajaxValidCache:{},autoPositionUpdate:true,InvalidFields:[],onFieldSuccess:false,onFieldFailure:false,onSuccess:false,onFailure:false,validateAttribute:"class",addSuccessCssClassToField:"",addFailureCssClassToField:"",autoHidePrompt:true,autoHideDelay:3000,fadeDuration:0.3,prettySelect:false,addPromptClass:"",usePrefix:"",useSuffix:"",showOneMessage:false}};B(function(){B.validationEngine.defaults.promptPosition=A.isRTL()?"bottomRight":"bottomRight"})})(jQuery);