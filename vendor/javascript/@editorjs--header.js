var t="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var i={};!function(t,a){i=a()}(window,(function(){return function(t){var i={};function n(a){if(i[a])return i[a].exports;var l=i[a]={i:a,l:!1,exports:{}};return t[a].call(l.exports,l,l.exports,n),l.l=!0,l.exports}return n.m=t,n.c=i,n.d=function(t,i,a){n.o(t,i)||Object.defineProperty(t,i,{enumerable:!0,get:a})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,i){if(1&i&&(t=n(t)),8&i)return t;if(4&i&&"object"==typeof t&&t&&t.__esModule)return t;var a=Object.create(null);if(n.r(a),Object.defineProperty(a,"default",{enumerable:!0,value:t}),2&i&&"string"!=typeof t)for(var l in t)n.d(a,l,function(i){return t[i]}.bind(null,l));return a},n.n=function(t){var i=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(i,"a",i),i},n.o=function(t,i){return Object.prototype.hasOwnProperty.call(t,i)},n.p="/",n(n.s=5)}([function(t,i,a){var l=a(1);"string"==typeof l&&(l=[[t.i,l,""]]);var u={hmr:!0,transform:void 0,insertInto:void 0};a(3)(l,u);l.locals&&(t.exports=l.locals)},function(t,i,a){(t.exports=a(2)(!1)).push([t.i,"/**\n * Plugin styles\n */\n.ce-header {\n  padding: 0.6em 0 3px;\n  margin: 0;\n  line-height: 1.25em;\n  outline: none;\n}\n\n.ce-header p,\n.ce-header div{\n  padding: 0 !important;\n  margin: 0 !important;\n}\n\n/**\n * Styles for Plugin icon in Toolbar\n */\n.ce-header__icon {}\n\n.ce-header[contentEditable=true][data-placeholder]::before{\n  position: absolute;\n  content: attr(data-placeholder);\n  color: #707684;\n  font-weight: normal;\n  display: none;\n  cursor: text;\n}\n\n.ce-header[contentEditable=true][data-placeholder]:empty::before {\n  display: block;\n}\n\n.ce-header[contentEditable=true][data-placeholder]:empty:focus::before {\n  display: none;\n}\n",""])},function(i,a){i.exports=function(i){var a=[];return a.toString=function(){return this.map((function(t){var a=function(t,i){var a=t[1]||"",l=t[3];if(!l)return a;if(i&&"function"==typeof btoa){var u=(f=l,"/*# sourceMappingURL=data:application/json;charset=utf-8;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(f))))+" */"),c=l.sources.map((function(t){return"/*# sourceURL="+l.sourceRoot+t+" */"}));return[a].concat(c).concat([u]).join("\n")}var f;return[a].join("\n")}(t,i);return t[2]?"@media "+t[2]+"{"+a+"}":a})).join("")},a.i=function(i,l){"string"==typeof i&&(i=[[null,i,""]]);for(var u={},c=0;c<(this||t).length;c++){var f=(this||t)[c][0];"number"==typeof f&&(u[f]=!0)}for(c=0;c<i.length;c++){var d=i[c];"number"==typeof d[0]&&u[d[0]]||(l&&!d[2]?d[2]=l:l&&(d[2]="("+d[2]+") and ("+l+")"),a.push(d))}},a}},function(i,a,l){var u,c,f={},d=(u=function(){return window&&document&&document.all&&!window.atob},function(){return void 0===c&&(c=u.apply(this||t,arguments)),c}),s=function(t){return document.querySelector(t)},w=function(i){var a={};return function(i){if("function"==typeof i)return i();if(void 0===a[i]){var l=s.call(this||t,i);if(window.HTMLIFrameElement&&l instanceof window.HTMLIFrameElement)try{l=l.contentDocument.head}catch(i){l=null}a[i]=l}return a[i]}}(),k=null,C=0,_=[],H=l(4);function p(t,i){for(var a=0;a<t.length;a++){var l=t[a],u=f[l.id];if(u){u.refs++;for(var c=0;c<u.parts.length;c++)u.parts[c](l.parts[c]);for(;c<l.parts.length;c++)u.parts.push(y(l.parts[c],i))}else{var d=[];for(c=0;c<l.parts.length;c++)d.push(y(l.parts[c],i));f[l.id]={id:l.id,refs:1,parts:d}}}}function h(t,i){for(var a=[],l={},u=0;u<t.length;u++){var c=t[u],f=i.base?c[0]+i.base:c[0],d={css:c[1],media:c[2],sourceMap:c[3]};l[f]?l[f].parts.push(d):a.push(l[f]={id:f,parts:[d]})}return a}function v(t,i){var a=w(t.insertInto);if(!a)throw new Error("Couldn't find a style target. This probably means that the value for the 'insertInto' parameter is invalid.");var l=_[_.length-1];if("top"===t.insertAt)l?l.nextSibling?a.insertBefore(i,l.nextSibling):a.appendChild(i):a.insertBefore(i,a.firstChild),_.push(i);else if("bottom"===t.insertAt)a.appendChild(i);else{if("object"!=typeof t.insertAt||!t.insertAt.before)throw new Error("[Style Loader]\n\n Invalid value for parameter 'insertAt' ('options.insertAt') found.\n Must be 'top', 'bottom', or Object.\n (https://github.com/webpack-contrib/style-loader#insertat)\n");var u=w(t.insertInto+" "+t.insertAt.before);a.insertBefore(i,u)}}function g(t){if(null===t.parentNode)return!1;t.parentNode.removeChild(t);var i=_.indexOf(t);i>=0&&_.splice(i,1)}function b(t){var i=document.createElement("style");return void 0===t.attrs.type&&(t.attrs.type="text/css"),m(i,t.attrs),v(t,i),i}function m(t,i){Object.keys(i).forEach((function(a){t.setAttribute(a,i[a])}))}function y(t,i){var a,l,u,c;if(i.transform&&t.css){if(!(c=i.transform(t.css)))return function(){};t.css=c}if(i.singleton){var f=C++;a=k||(k=b(i)),l=L.bind(null,a,f,!1),u=L.bind(null,a,f,!0)}else t.sourceMap&&"function"==typeof URL&&"function"==typeof URL.createObjectURL&&"function"==typeof URL.revokeObjectURL&&"function"==typeof Blob&&"function"==typeof btoa?(a=function(t){var i=document.createElement("link");return void 0===t.attrs.type&&(t.attrs.type="text/css"),t.attrs.rel="stylesheet",m(i,t.attrs),v(t,i),i}(i),l=x.bind(null,a,i),u=function(){g(a),a.href&&URL.revokeObjectURL(a.href)}):(a=b(i),l=M.bind(null,a),u=function(){g(a)});return l(t),function(i){if(i){if(i.css===t.css&&i.media===t.media&&i.sourceMap===t.sourceMap)return;l(t=i)}else u()}}i.exports=function(t,i){if("undefined"!=typeof DEBUG&&DEBUG&&"object"!=typeof document)throw new Error("The style-loader cannot be used in a non-browser environment");(i=i||{}).attrs="object"==typeof i.attrs?i.attrs:{},i.singleton||"boolean"==typeof i.singleton||(i.singleton=d()),i.insertInto||(i.insertInto="head"),i.insertAt||(i.insertAt="bottom");var a=h(t,i);return p(a,i),function(t){for(var l=[],u=0;u<a.length;u++){var c=a[u];(d=f[c.id]).refs--,l.push(d)}t&&p(h(t,i),i);for(u=0;u<l.length;u++){var d;if(0===(d=l[u]).refs){for(var w=0;w<d.parts.length;w++)d.parts[w]();delete f[d.id]}}}};var S,T=(S=[],function(t,i){return S[t]=i,S.filter(Boolean).join("\n")});function L(t,i,a,l){var u=a?"":l.css;if(t.styleSheet)t.styleSheet.cssText=T(i,u);else{var c=document.createTextNode(u),f=t.childNodes;f[i]&&t.removeChild(f[i]),f.length?t.insertBefore(c,f[i]):t.appendChild(c)}}function M(t,i){var a=i.css,l=i.media;if(l&&t.setAttribute("media",l),t.styleSheet)t.styleSheet.cssText=a;else{for(;t.firstChild;)t.removeChild(t.firstChild);t.appendChild(document.createTextNode(a))}}function x(t,i,a){var l=a.css,u=a.sourceMap,c=void 0===i.convertToAbsoluteUrls&&u;(i.convertToAbsoluteUrls||c)&&(l=H(l)),u&&(l+="\n/*# sourceMappingURL=data:application/json;base64,"+btoa(unescape(encodeURIComponent(JSON.stringify(u))))+" */");var f=new Blob([l],{type:"text/css"}),d=t.href;t.href=URL.createObjectURL(f),d&&URL.revokeObjectURL(d)}},function(t,i){t.exports=function(t){var i="undefined"!=typeof window&&window.location;if(!i)throw new Error("fixUrls requires window.location");if(!t||"string"!=typeof t)return t;var a=i.protocol+"//"+i.host,l=a+i.pathname.replace(/\/[^\/]*$/,"/");return t.replace(/url\s*\(((?:[^)(]|\((?:[^)(]+|\([^)(]*\))*\))*)\)/gi,(function(t,i){var u,c=i.trim().replace(/^"(.*)"$/,(function(t,i){return i})).replace(/^'(.*)'$/,(function(t,i){return i}));return/^(#|data:|http:\/\/|https:\/\/|file:\/\/\/|\s*$)/i.test(c)?t:(u=0===c.indexOf("//")?c:0===c.indexOf("/")?a+c:l+c.replace(/^\.\//,""),"url("+JSON.stringify(u)+")")}))}},function(i,a,l){l.r(a),l.d(a,"default",(function(){return u}));l(0);function r(t){return(r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t})(t)}function o(t,i){for(var a=0;a<i.length;a++){var l=i[a];l.enumerable=l.enumerable||!1,l.configurable=!0,"value"in l&&(l.writable=!0),Object.defineProperty(t,l.key,l)}}
/**
     * Header block for the Editor.js.
     *
     * @author CodeX (team@ifmo.su)
     * @copyright CodeX 2018
     * @license MIT
     * @version 2.0.0
     */var u=function(){function e(i){var a=i.data,l=i.config,u=i.api,c=i.readOnly;!function(t,i){if(!(t instanceof i))throw new TypeError("Cannot call a class as a function")}(this||t,e),(this||t).api=u,(this||t).readOnly=c,(this||t)._CSS={block:(this||t).api.styles.block,wrapper:"ce-header"},(this||t)._settings=l,(this||t)._data=this.normalizeData(a),(this||t)._element=this.getTag()}var i,a,l;return i=e,l=[{key:"conversionConfig",get:function(){return{export:"text",import:"text"}}},{key:"sanitize",get:function(){return{level:!1,text:{}}}},{key:"isReadOnlySupported",get:function(){return!0}},{key:"pasteConfig",get:function(){return{tags:["H1","H2","H3","H4","H5","H6"]}}},{key:"toolbox",get:function(){return{icon:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M9 7L9 12M9 17V12M9 12L15 12M15 7V12M15 17L15 12"/></svg>',title:"Heading"}}}],(a=[{key:"normalizeData",value:function(i){var a={};return"object"!==r(i)&&(i={}),a.text=i.text||"",a.level=parseInt(i.level)||(this||t).defaultLevel.number,a}},{key:"render",value:function(){return(this||t)._element}},{key:"renderSettings",value:function(){var i=this||t;return(this||t).levels.map((function(t){return{icon:t.svg,label:i.api.i18n.t("Heading ".concat(t.number)),onActivate:function(){return i.setLevel(t.number)},closeOnActivate:!0,isActive:i.currentLevel.number===t.number}}))}},{key:"setLevel",value:function(i){(this||t).data={level:i,text:(this||t).data.text}}},{key:"merge",value:function(i){var a={text:(this||t).data.text+i.text,level:(this||t).data.level};(this||t).data=a}},{key:"validate",value:function(t){return""!==t.text.trim()}},{key:"save",value:function(i){return{text:i.innerHTML,level:(this||t).currentLevel.number}}},{key:"getTag",value:function(){var i=document.createElement((this||t).currentLevel.tag);return i.innerHTML=(this||t)._data.text||"",i.classList.add((this||t)._CSS.wrapper),i.contentEditable=(this||t).readOnly?"false":"true",i.dataset.placeholder=(this||t).api.i18n.t((this||t)._settings.placeholder||""),i}},{key:"onPaste",value:function(i){var a=i.detail.data,l=(this||t).defaultLevel.number;switch(a.tagName){case"H1":l=1;break;case"H2":l=2;break;case"H3":l=3;break;case"H4":l=4;break;case"H5":l=5;break;case"H6":l=6}(this||t)._settings.levels&&(l=(this||t)._settings.levels.reduce((function(t,i){return Math.abs(i-l)<Math.abs(t-l)?i:t}))),(this||t).data={level:l,text:a.innerHTML}}},{key:"data",get:function(){return(this||t)._data.text=(this||t)._element.innerHTML,(this||t)._data.level=(this||t).currentLevel.number,(this||t)._data},set:function(i){if((this||t)._data=this.normalizeData(i),void 0!==i.level&&(this||t)._element.parentNode){var a=this.getTag();a.innerHTML=(this||t)._element.innerHTML,(this||t)._element.parentNode.replaceChild(a,(this||t)._element),(this||t)._element=a}void 0!==i.text&&((this||t)._element.innerHTML=(this||t)._data.text||"")}},{key:"currentLevel",get:function(){var i=this||t,a=(this||t).levels.find((function(t){return t.number===i._data.level}));return a||(a=(this||t).defaultLevel),a}},{key:"defaultLevel",get:function(){var i=this||t;if((this||t)._settings.defaultLevel){var a=(this||t).levels.find((function(t){return t.number===i._settings.defaultLevel}));if(a)return a;console.warn("(ง'̀-'́)ง Heading Tool: the default level specified was not found in available levels")}return(this||t).levels[1]}},{key:"levels",get:function(){var i=this||t,a=[{number:1,tag:"H1",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M19 17V10.2135C19 10.1287 18.9011 10.0824 18.836 10.1367L16 12.5"/></svg>'},{number:2,tag:"H2",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M16 11C16 10 19 9.5 19 12C19 13.9771 16.0684 13.9997 16.0012 16.8981C15.9999 16.9533 16.0448 17 16.1 17L19.3 17"/></svg>'},{number:3,tag:"H3",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M16 11C16 10.5 16.8323 10 17.6 10C18.3677 10 19.5 10.311 19.5 11.5C19.5 12.5315 18.7474 12.9022 18.548 12.9823C18.5378 12.9864 18.5395 13.0047 18.5503 13.0063C18.8115 13.0456 20 13.3065 20 14.8C20 16 19.5 17 17.8 17C17.8 17 16 17 16 16.3"/></svg>'},{number:4,tag:"H4",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M18 10L15.2834 14.8511C15.246 14.9178 15.294 15 15.3704 15C16.8489 15 18.7561 15 20.2 15M19 17C19 15.7187 19 14.8813 19 13.6"/></svg>'},{number:5,tag:"H5",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M16 15.9C16 15.9 16.3768 17 17.8 17C19.5 17 20 15.6199 20 14.7C20 12.7323 17.6745 12.0486 16.1635 12.9894C16.094 13.0327 16 12.9846 16 12.9027V10.1C16 10.0448 16.0448 10 16.1 10H19.8"/></svg>'},{number:6,tag:"H6",svg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M6 7L6 12M6 17L6 12M6 12L12 12M12 7V12M12 17L12 12"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M19.5 10C16.5 10.5 16 13.3285 16 15M16 15V15C16 16.1046 16.8954 17 18 17H18.3246C19.3251 17 20.3191 16.3492 20.2522 15.3509C20.0612 12.4958 16 12.6611 16 15Z"/></svg>'}];return(this||t)._settings.levels?a.filter((function(t){return i._settings.levels.includes(t.number)})):a}}])&&o(i.prototype,a),l&&o(i,l),e}()}]).default}));var a=i;const l=i.Header;export{l as Header,a as default};

