(function(){try{if(typeof document<"u"){var t=document.createElement("style");t.appendChild(document.createTextNode('.cdx-nested-list{margin:0;padding:0;outline:none;counter-reset:item;list-style:none}.cdx-nested-list__item{line-height:1.6em;display:flex;margin:2px 0}.cdx-nested-list__item [contenteditable]{outline:none}.cdx-nested-list__item-body{flex-grow:2}.cdx-nested-list__item-content,.cdx-nested-list__item-children{flex-basis:100%}.cdx-nested-list__item-content{word-break:break-word;white-space:pre-wrap}.cdx-nested-list__item:before{counter-increment:item;margin-right:5px;white-space:nowrap}.cdx-nested-list--ordered>.cdx-nested-list__item:before{content:counters(item,".") ". "}.cdx-nested-list--unordered>.cdx-nested-list__item:before{content:"•"}.cdx-nested-list__settings{display:flex}.cdx-nested-list__settings .cdx-settings-button{width:50%}')),document.head.appendChild(t)}}catch(t){console.error("vite-plugin-css-injected-by-js",t)}})();function p(t,r=null,s={}){const n=document.createElement(t);Array.isArray(r)?n.classList.add(...r):r&&n.classList.add(r);for(const t in s)n[t]=s[t];return n}function g(t){const r=p("div");return r.appendChild(t),r.innerHTML}function C(t){let r;return t.nodeType!==Node.ELEMENT_NODE?r=t.textContent:(r=t.innerHTML,r=r.replaceAll("<br>","")),r.trim().length===0}class c{constructor(){this.savedFakeCaret=void 0}
/**
   * Saves caret position using hidden <span>
   *
   * @returns {void}
   */save(){const t=c.range,r=p("span");r.hidden=!0,t.insertNode(r),this.savedFakeCaret=r
/**
   * Restores the caret position saved by the save() method
   *
   * @returns {void}
   */}restore(){if(!this.savedFakeCaret)return;const t=window.getSelection(),r=new Range;r.setStartAfter(this.savedFakeCaret),r.setEndAfter(this.savedFakeCaret),t.removeAllRanges(),t.addRange(r),setTimeout((()=>{this.savedFakeCaret.remove()}),150)
/**
   * Returns the first range
   *
   * @returns {Range|null}
   */}static get range(){const t=window.getSelection();return t&&t.rangeCount?t.getRangeAt(0):null}
/**
   * Extract content fragment from Caret position to the end of contenteditable element
   *
   * @returns {DocumentFragment|void}
   */static extractFragmentFromCaretPositionTillTheEnd(){const t=window.getSelection();if(!t.rangeCount)return;const r=t.getRangeAt(0);let s=r.startContainer;s.nodeType!==Node.ELEMENT_NODE&&(s=s.parentNode);const n=s.closest("[contenteditable]");r.deleteContents();const i=r.cloneRange();return i.selectNodeContents(n),i.setStart(r.endContainer,r.endOffset),i.extractContents()
/**
   * Set focus to contenteditable or native input element
   *
   * @param {HTMLElement} element - element where to set focus
   * @param {boolean} atStart - where to set focus: at the start or at the end
   * @returns {void}
   */}static focus(t,r=!0){const s=document.createRange(),n=window.getSelection();s.selectNodeContents(t),s.collapse(r),n.removeAllRanges(),n.addRange(s)
/**
   * Check if the caret placed at the start of the contenteditable element
   *
   * @returns {void}
   */}static isAtStart(){const t=window.getSelection();if(t.focusOffset>0)return!1;const r=t.focusNode;return c.getHigherLevelSiblings(r,"left").every((t=>C(t)))}
/**
   * Get all first-level (first child of [contenteditabel]) siblings from passed node
   * Then you can check it for emptiness
   *
   * @example
   * <div contenteditable>
   * <p></p>                            |
   * <p></p>                            | left first-level siblings
   * <p></p>                            |
   * <blockquote><a><b>adaddad</b><a><blockquote>       <-- passed node for example <b>
   * <p></p>                            |
   * <p></p>                            | right first-level siblings
   * <p></p>                            |
   * </div>
   * @param {HTMLElement} from - element from which siblings should be searched
   * @param {'left' | 'right'} direction - direction of search
   * @returns {HTMLElement[]}
   */static getHigherLevelSiblings(t,r="left"){let s=t;const n=[];for(;s.parentNode&&s.parentNode.contentEditable!=="true";)s=s.parentNode;const i=r==="left"?"previousSibling":"nextSibling";for(;s[i];)s=s[i],n.push(s);return n}}const t='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><line x1="9" x2="19" y1="7" y2="7" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><line x1="9" x2="19" y1="12" y2="12" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><line x1="9" x2="19" y1="17" y2="17" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M5.00001 17H4.99002"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M5.00001 12H4.99002"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M5.00001 7H4.99002"/></svg>',r='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><line x1="12" x2="19" y1="7" y2="7" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><line x1="12" x2="19" y1="12" y2="12" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><line x1="12" x2="19" y1="17" y2="17" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M7.79999 14L7.79999 7.2135C7.79999 7.12872 7.7011 7.0824 7.63597 7.13668L4.79999 9.5"/></svg>';class u{
/**
   * Notify core that read-only mode is supported
   *
   * @returns {boolean}
   */
static get isReadOnlySupported(){return!0}
/**
   * Allow to use native Enter behaviour
   *
   * @returns {boolean}
   * @public
   */static get enableLineBreaks(){return!0}
/**
   * Get Tool toolbox settings
   * icon - Tool icon's SVG
   * title - title to show in toolbox
   *
   * @returns {{icon: string, title: string}}
   */static get toolbox(){return{icon:r,title:"List"}}
/**
   * Render plugin`s main Element and fill it with saved data
   *
   * @param {object} params - tool constructor options
   * @param {ListData} params.data - previously saved data
   * @param {object} params.config - user config for Tool
   * @param {object} params.api - Editor.js API
   * @param {boolean} params.readOnly - read-only mode flag
   */constructor({data:t,config:r,api:s,readOnly:n}){this.nodes={wrapper:null},this.api=s,this.readOnly=n,this.config=r,this.defaultListStyle=this.config.defaultStyle==="ordered"?"ordered":"unordered";const i={style:this.defaultListStyle,items:[]};this.data=t&&Object.keys(t).length?t:i,this.caret=new c
/**
   * Returns list tag with items
   *
   * @returns {Element}
   * @public
   */}render(){return this.nodes.wrapper=this.makeListWrapper(this.data.style,[this.CSS.baseBlock]),this.data.items.length?this.appendItems(this.data.items,this.nodes.wrapper):this.appendItems([{content:"",items:[]}],this.nodes.wrapper),this.readOnly||this.nodes.wrapper.addEventListener("keydown",(t=>{switch(t.key){case"Enter":this.enterPressed(t);break;case"Backspace":this.backspace(t);break;case"Tab":t.shiftKey?this.shiftTab(t):this.addTab(t);break}}),!1),this.nodes.wrapper
/**
   * Creates Block Tune allowing to change the list style
   *
   * @public
   * @returns {Array}
   */}renderSettings(){return[{name:"unordered",label:this.api.i18n.t("Unordered"),icon:t},{name:"ordered",label:this.api.i18n.t("Ordered"),icon:r}].map((t=>({name:t.name,icon:t.icon,label:t.label,isActive:this.data.style===t.name,closeOnActivate:!0,onActivate:()=>{this.listStyle=t.name}})))}
/**
   * On paste sanitzation config. Allow only tags that are allowed in the Tool.
   *
   * @returns {PasteConfig} - paste config.
   */static get pasteConfig(){return{tags:["OL","UL","LI"]}}
/**
   * On paste callback that is fired from Editor.
   *
   * @param {PasteEvent} event - event with pasted data
   */onPaste(t){const r=t.detail.data;this.data=this.pasteHandler(r);const s=this.nodes.wrapper;s&&s.parentNode.replaceChild(this.render(),s)}
/**
   * Handle UL, OL and LI tags paste and returns List data
   *
   * @param {HTMLUListElement|HTMLOListElement|HTMLLIElement} element
   * @returns {ListData}
   */pasteHandler(t){const{tagName:r}=t;let s,n;switch(r){case"OL":s="ordered",n="ol";break;case"UL":case"LI":s="unordered",n="ul"}const i={style:s,items:[]},o=t=>Array.from(t.querySelectorAll(":scope > li")).map((t=>{var r;const s=t.querySelector(`:scope > ${n}`),i=s?o(s):[];return{content:((r=t==null?void 0:t.firstChild)==null?void 0:r.textContent)||"",items:i}}));return i.items=o(t),i
/**
   * Renders children list
   *
   * @param {ListItem[]} items - items data to append
   * @param {Element} parentItem - where to append
   * @returns {void}
   */}appendItems(t,r){t.forEach((t=>{const s=this.createItem(t.content,t.items);r.appendChild(s)}))}
/**
   * Renders the single item
   *
   * @param {string} content - item content to render
   * @param {ListItem[]} [items] - children
   * @returns {Element}
   */createItem(t,r=[]){const s=p("li",this.CSS.item),n=p("div",this.CSS.itemBody),i=p("div",this.CSS.itemContent,{innerHTML:t,contentEditable:!this.readOnly});return n.appendChild(i),s.appendChild(n),r&&r.length>0&&this.addChildrenList(s,r),s
/**
   * Extracts tool's data from the DOM
   *
   * @returns {ListData}
   */}save(){const e=t=>Array.from(t.querySelectorAll(`:scope > .${this.CSS.item}`)).map((t=>{const r=t.querySelector(`.${this.CSS.itemChildren}`),s=this.getItemContent(t),n=r?e(r):[];return{content:s,items:n}}));return{style:this.data.style,items:e(this.nodes.wrapper)}}
/**
   * Append children list to passed item
   *
   * @param {Element} parentItem - item that should contain passed sub-items
   * @param {ListItem[]} items - sub items to append
   */addChildrenList(t,r){const s=t.querySelector(`.${this.CSS.itemBody}`),n=this.makeListWrapper(void 0,[this.CSS.itemChildren]);this.appendItems(r,n),s.appendChild(n)
/**
   * Creates main <ul> or <ol> tag depended on style
   *
   * @param {string} [style] - 'ordered' or 'unordered'
   * @param {string[]} [classes] - additional classes to append
   * @returns {HTMLOListElement|HTMLUListElement}
   */}makeListWrapper(t=this.listStyle,r=[]){const s=t==="ordered"?"ol":"ul",n=t==="ordered"?this.CSS.wrapperOrdered:this.CSS.wrapperUnordered;return r.push(n),p(s,[this.CSS.wrapper,...r])
/**
   * Styles
   *
   * @returns {object} - CSS classes names by keys
   * @private
   */}get CSS(){return{baseBlock:this.api.styles.block,wrapper:"cdx-nested-list",wrapperOrdered:"cdx-nested-list--ordered",wrapperUnordered:"cdx-nested-list--unordered",item:"cdx-nested-list__item",itemBody:"cdx-nested-list__item-body",itemContent:"cdx-nested-list__item-content",itemChildren:"cdx-nested-list__item-children",settingsWrapper:"cdx-nested-list__settings",settingsButton:this.api.styles.settingsButton,settingsButtonActive:this.api.styles.settingsButtonActive}}
/**
   * Get list style name
   *
   * @returns {string}
   */get listStyle(){return this.data.style||this.defaultListStyle}
/**
   * Set list style
   *
   * @param {string} style - new style to set
   */set listStyle(t){const r=Array.from(this.nodes.wrapper.querySelectorAll(`.${this.CSS.wrapper}`));r.push(this.nodes.wrapper),r.forEach((r=>{r.classList.toggle(this.CSS.wrapperUnordered,t==="unordered"),r.classList.toggle(this.CSS.wrapperOrdered,t==="ordered")})),this.data.style=t
/**
   * Returns current List item by the caret position
   *
   * @returns {Element}
   */}get currentItem(){let t=window.getSelection().anchorNode;return t.nodeType!==Node.ELEMENT_NODE&&(t=t.parentNode),t.closest(`.${this.CSS.item}`)
/**
   * Handles Enter keypress
   *
   * @param {KeyboardEvent} event - keydown
   * @returns {void}
   */}enterPressed(t){const r=this.currentItem;if(t.stopPropagation(),t.preventDefault(),t.isComposing)return;const s=this.getItemContent(r).trim().length===0,n=r.parentNode===this.nodes.wrapper,i=r.nextElementSibling===null;if(n&&i&&s){this.getOutOfList();return}if(i&&s){this.unshiftItem();return}const a=c.extractFragmentFromCaretPositionTillTheEnd(),d=g(a),l=r.querySelector(`.${this.CSS.itemChildren}`),h=this.createItem(d,void 0);l&&Array.from(l.querySelectorAll(`.${this.CSS.item}`)).length>0?l.prepend(h):r.after(h),this.focusItem(h)
/**
   * Decrease indentation of the current item
   *
   * @returns {void}
   */}unshiftItem(){const t=this.currentItem,r=t.parentNode.closest(`.${this.CSS.item}`);if(!r)return;this.caret.save(),r.after(t),this.caret.restore();const s=r.querySelector(`.${this.CSS.itemChildren}`);s.children.length===0&&s.remove()}
/**
   * Return the item content
   *
   * @param {Element} item - item wrapper (<li>)
   * @returns {string}
   */getItemContent(t){const r=t.querySelector(`.${this.CSS.itemContent}`);return C(r)?"":r.innerHTML}
/**
   * Sets focus to the item's content
   *
   * @param {Element} item - item (<li>) to select
   * @param {boolean} atStart - where to set focus: at the start or at the end
   * @returns {void}
   */focusItem(t,r=!0){const s=t.querySelector(`.${this.CSS.itemContent}`);c.focus(s,r)}
/**
   * Get out from List Tool by Enter on the empty last item
   *
   * @returns {void}
   */getOutOfList(){this.currentItem.remove(),this.api.blocks.insert(),this.api.caret.setToBlock(this.api.blocks.getCurrentBlockIndex())
/**
   * Handle backspace
   *
   * @param {KeyboardEvent} event - keydown
   */}backspace(t){if(!c.isAtStart())return;t.preventDefault();const r=this.currentItem,s=r.previousSibling,n=r.parentNode.closest(`.${this.CSS.item}`);if(!s&&!n)return;t.stopPropagation();let i;if(s){const t=s.querySelectorAll(`.${this.CSS.item}`);i=Array.from(t).pop()||s}else i=n;const a=c.extractFragmentFromCaretPositionTillTheEnd(),d=g(a),l=i.querySelector(`.${this.CSS.itemContent}`);c.focus(l,!1),this.caret.save(),l.insertAdjacentHTML("beforeend",d);let h=r.querySelectorAll(`.${this.CSS.itemChildren} > .${this.CSS.item}`);h=Array.from(h),h=h.filter((t=>t.parentNode.closest(`.${this.CSS.item}`)===r)),h.reverse().forEach((t=>{s?i.after(t):r.after(t)})),r.remove(),this.caret.restore()
/**
   * Add indentation to current item
   *
   * @param {KeyboardEvent} event - keydown
   */}addTab(t){t.stopPropagation(),t.preventDefault();const r=this.currentItem,s=r.previousSibling;if(!s)return;const n=s.querySelector(`.${this.CSS.itemChildren}`);if(this.caret.save(),n)n.appendChild(r);else{const t=this.makeListWrapper(void 0,[this.CSS.itemChildren]),n=s.querySelector(`.${this.CSS.itemBody}`);t.appendChild(r),n.appendChild(t)}this.caret.restore()}
/**
   * Reduce indentation for current item
   *
   * @param {KeyboardEvent} event - keydown
   * @returns {void}
   */shiftTab(t){t.stopPropagation(),t.preventDefault(),this.unshiftItem()
/**
   * Convert from list to text for conversionConfig
   *
   * @param {ListData} data
   * @returns {string}
   */}static joinRecursive(t){return t.items.map((t=>`${t.content} ${u.joinRecursive(t)}`)).join("")}static get conversionConfig(){return{export:t=>u.joinRecursive(t),import:t=>({items:[{content:t,items:[]}],style:"unordered"})}}}export{u as default};

