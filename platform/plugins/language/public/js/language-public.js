(()=>{"use strict";function e(n){return e="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e},e(n)}function n(n,r){for(var o=0;o<r.length;o++){var t=r[o];t.enumerable=t.enumerable||!1,t.configurable=!0,"value"in t&&(t.writable=!0),Object.defineProperty(n,(i=t.key,a=void 0,a=function(n,r){if("object"!==e(n)||null===n)return n;var o=n[Symbol.toPrimitive];if(void 0!==o){var t=o.call(n,r||"default");if("object"!==e(t))return t;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===r?String:Number)(n)}(i,"string"),"symbol"===e(a)?a:String(a)),t)}var i,a}var r=function(){function e(){!function(e,n){if(!(e instanceof n))throw new TypeError("Cannot call a class as a function")}(this,e)}var r,o,t;return r=e,(o=[{key:"init",value:function(){$(".language-wrapper .dropdown .dropdown-toggle").off("click").on("click",(function(e){e.preventDefault();var n=$(e.currentTarget);n.hasClass("active")?(n.closest(".language-wrapper").find(".dropdown .dropdown-menu").hide(),n.removeClass("active")):(n.closest(".language-wrapper").find(".dropdown .dropdown-menu").show(),n.addClass("active"))})),$(document).on("click",(function(e){var n=$(e.currentTarget);0===n.closest(".language-wrapper").length&&(n.closest(".language-wrapper").find(".dropdown .dropdown-menu").hide(),n.closest(".language-wrapper").find(".dropdown .dropdown-toggle").removeClass("active"))}))}}])&&n(r.prototype,o),t&&n(r,t),Object.defineProperty(r,"prototype",{writable:!1}),e}();$((function(){(new r).init()}))})();