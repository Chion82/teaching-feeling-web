tyrano.plugin.kag.tag.eval = {
    vital: ["exp"],
    pm: {
        exp: ""
    },
    start: function(pm) {
        this.kag.evalScript(pm.exp);
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.clearvar = {
    pm: {},
    start: function(pm) {
        this.kag.clearVariable();
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.clearsysvar = {
    start: function() {
        this.kag.variable.sf = {};
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag["close"] = {
    pm: {
        ask: "true"
    },
    start: function(pm) {
        if (pm.ask == "true") {
            if (confirm($.lang("exit_game"))) this.close()
        } else this.close()
    },
    close: function() {
        window.close();
        if (typeof navigator.app != "undefined") navigator.app.exitApp();
        if (typeof require != "undefined" && typeof require("nw.gui") != "undefined") require("nw.gui").Window.get().close()
    }
};
tyrano.plugin.kag.tag["trace"] = {
    pm: {
        exp: ""
    },
    start: function(pm) {
        var val = this.kag.embScript(pm.exp);
        this.kag.log("trace\u51fa\u529b\uff1a" + val);
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag["title"] = {
    vital: ["name"],
    pm: {
        name: ""
    },
    start: function(pm) {
        if (pm.name != "") {
            this.kag.setTitle(pm.name);
            this.kag.ftag.nextOrder()
        }
    }
};
tyrano.plugin.kag.tag.iscript = {
    start: function(pm) {
        this.kag.stat.is_script = true;
        this.kag.stat.buff_script = "";
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.endscript = {
    start: function(pm) {
        this.kag.evalScript(this.kag.stat.buff_script);
        this.kag.stat.is_script = false;
        this.kag.stat.buff_script = "";
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.html = {
    pm: {
        layer: "",
        top: 0,
        left: 0
    },
    start: function(pm) {
        this.kag.stat.is_html = true;
        this.kag.stat.map_html = {};
        this.kag.stat.map_html.buff_html = "";
        this.kag.stat.map_html.buff_pm = pm;
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.endhtml = {
    start: function(pm) {
        var that = this;
        var tpm = this.kag.stat.map_html.buff_pm;
        var html = this.kag.stat.map_html.buff_html;
        var html_obj = $("<div></div>");
        html_obj.css("position", "absolute");
        html_obj.css("top", tpm.top + "px");
        html_obj.css("left", tpm.left + "px");
        $.setName(html_obj, tpm.name);
        html_obj.append($(html));
        var layer_free = this.kag.layer.getFreeLayer();
        layer_free.css("z-index", 9999999);
        layer_free.append(html_obj);
        layer_free.show();
        this.kag.stat.is_html = false;
        this.kag.stat.map_html = {};
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.emb = {
    vital: ["exp"],
    pm: {
        exp: ""
    },
    start: function(pm) {
        var val = "" + this.kag.embScript(pm.exp);
        this.kag.ftag.startTag("text", {
            "val": val
        })
    }
};
tyrano.plugin.kag.tag["if"] = {
    vital: ["exp"],
    pm: {
        "exp": ""
    },
    start: function(pm) {
        if (this.kag.embScript(pm.exp)) {
            this.kag.pushStack("if", true);
            this.kag.ftag.nextOrder()
        } else {
            this.kag.pushStack("if", false);
            for (var i = 0; i < 2E3; i++) {
                var r = this.kag.ftag.nextOrderWithTag({
                    "else": "",
                    "elsif": "",
                    "endif": ""
                });
                if (r == true) break
            }
            if (i > 1900) this.kag.error("If\u6587\u306b\u8aa4\u308a\u304c\u3042\u308a\u307e\u3059")
        }
    }
};
tyrano.plugin.kag.tag["elsif"] = {
    vital: ["exp"],
    pm: {
        "exp": ""
    },
    start: function(pm) {
        if (this.kag.getStack("if") == false && this.kag.embScript(pm.exp)) {
            this.kag.setStack("if", true);
            this.kag.ftag.nextOrder()
        } else {
            for (var i = 0; i < 2E3; i++) {
                var r = this.kag.ftag.nextOrderWithTag({
                    "else": "",
                    "elsif": "",
                    "endif": ""
                });
                if (r == true) break
            }
            if (i > 1900) this.kag.error("If\u6587\u306b\u8aa4\u308a\u304c\u3042\u308a\u307e\u3059")
        }
    }
};
tyrano.plugin.kag.tag["else"] = {
    pm: {
        "exp": ""
    },
    start: function(pm) {
        if (this.kag.getStack("if") == false) {
            this.kag.setStack("if", true);
            this.kag.ftag.nextOrder()
        } else {
            for (var i = 0; i < 2E3; i++) {
                var r = this.kag.ftag.nextOrderWithTag({
                    "endif": ""
                });
                if (r == true) break
            }
            if (i > 1900) this.kag.error("If\u6587\u306b\u8aa4\u308a\u304c\u3042\u308a\u307e\u3059")
        }
    }
};
tyrano.plugin.kag.tag["endif"] = {
    start: function() {
        this.kag.popStack("if");
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag["call"] = {
    pm: {
        storage: null,
        target: null,
        countpage: true,
        auto_next: "yes"
    },
    start: function(pm) {
        var back_pm = {};
        back_pm.index = this.kag.ftag.current_order_index;
        back_pm.storage = this.kag.stat.current_scenario;
        back_pm.auto_next = pm.auto_next;
        this.kag.pushStack("call", back_pm);
        if (pm.target == null && pm.storage != null) this.kag.ftag.nextOrderWithIndex(-1, pm.storage);
        else this.kag.ftag.nextOrderWithLabel(pm.target, pm.storage)
    }
};
tyrano.plugin.kag.tag["return"] = {
    start: function() {
        var pm = this.kag.getStack("call");
        var auto_next = pm.auto_next;
        this.kag.ftag.nextOrderWithIndex(pm.index, pm.storage, undefined, undefined, auto_next);
        this.kag.popStack("call")
    }
};
tyrano.plugin.kag.tag.macro = {
    vital: ["name"],
    pm: {
        name: ""
    },
    start: function(pm) {
        var index = this.kag.ftag.current_order_index;
        var storage = this.kag.stat.current_scenario;
        this.kag.stat.map_macro[pm.name] = {
            "storage": storage,
            "index": index
        };
        this.kag.tmp.checking_macro = true;
        for (var i = 0; i < 2E3; i++) {
            var r = this.kag.ftag.nextOrderWithTag({
                "endmacro": ""
            });
            if (r == true) break
        }
        if (i > 1900) this.kag.error("\u30de\u30af\u30ed\u304c\u9589\u3058\u3066\u3044\u307e\u305b\u3093")
    }
};
tyrano.plugin.kag.tag.endmacro = {
    start: function(pm) {
        if (this.kag.tmp.checking_macro == true) {
            this.kag.tmp.checking_macro = false;
            this.kag.ftag.nextOrder();
            return
        }
        var map_obj = this.kag.getStack("macro");
        if (map_obj) {
            this.kag.ftag.nextOrderWithIndex(map_obj.index, map_obj.storage, true);
            this.kag.popStack("macro");
            this.kag.stat.mp = this.kag.getStack("macro")
        } else;
    }
};
tyrano.plugin.kag.tag.erasemacro = {
    vital: ["name"],
    pm: {
        name: ""
    },
    start: function(pm) {
        delete this.kag.stat.map_macro[pm.name]
    }
};
tyrano.plugin.kag.tag.savesnap = {
    vital: ["title"],
    pm: {
        title: ""
    },
    start: function(pm) {
        this.kag.menu.snapSave(pm.title)
    }
};
tyrano.plugin.kag.tag.autosave = {
    vital: [],
    pm: {
        title: ""
    },
    start: function(pm) {
        var that = this;
        if (pm.title == "") pm.title = this.kag.stat.current_message_str;
        this.kag.menu.snapSave(pm.title, function() {
            that.kag.menu.doSetAutoSave();
            that.kag.ftag.nextOrder()
        })
    }
};
tyrano.plugin.kag.tag.autoload = {
    vital: [],
    pm: {
        title: ""
    },
    start: function(pm) {
        var game_data = $.getStorage(this.kag.config.projectID + "_tyrano_auto_save");
        this.kag.menu.loadAutoSave()
    }
};
tyrano.plugin.kag.tag.ignore = {
    vital: ["exp"],
    pm: {
        exp: ""
    },
    start: function(pm) {
        if (this.kag.embScript(pm.exp)) {
            for (var i = 0; i < 2E3; i++) {
                var r = this.kag.ftag.nextOrderWithTag({
                    "endignore": ""
                });
                if (r == true) break
            }
            if (i > 1900) this.kag.error("ignore\u304c\u9589\u3058\u3066\u3044\u307e\u305b\u3093")
        } else this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.endignore = {
    start: function() {
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.edit = {
    vital: ["name"],
    pm: {
        name: "",
        length: "",
        color: "black",
        left: "0",
        top: "0",
        size: "20px",
        width: "200",
        height: "40",
        maxchars: "1000"
    },
    start: function(pm) {
        var j_text = $("<input class='text_box form' name='" + pm.name + "' type='text' value='' />");
        pm = $.minifyObject(pm);
        var new_style = {
            color: $.convertColor(pm.color),
            left: parseInt(pm.left),
            top: parseInt(pm.top),
            width: pm.width,
            height: pm.height,
            "font-size": pm.size
        };
        j_text.css(new_style);
        j_text.css("position", "absolute");
        j_text.attr("maxlength",
            pm.maxchars);
        this.kag.layer.getFreeLayer().append(j_text);
        this.kag.layer.getFreeLayer().show();
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.preload = {
    vital: ["storage"],
    pm: {
        storage: "",
        wait: "false"
    },
    start: function(pm) {
        var that = this;
        if (pm.wait == "true") this.kag.layer.hideEventLayer();
        var storage = pm.storage;
        if (typeof storage == "object" && storage.length > 0) {
            var sum = 0;
            for (var i = 0; i < storage.length; i++) that.kag.preload(storage[i], function() {
                sum++;
                if (storage.length == sum) {
                    if (pm.wait == "true") that.kag.layer.showEventLayer();
                    that.kag.ftag.nextOrder()
                }
            })
        } else this.kag.preload(pm.storage, function() {
            if (pm.wait == "true") that.kag.layer.showEventLayer();
            that.kag.ftag.nextOrder()
        })
    }
};
tyrano.plugin.kag.tag.clearfix = {
    pm: {
        name: ""
    },
    start: function(pm) {
        if (pm.name != "") $(".fixlayer." + pm.name).remove();
        else $(".fixlayer").remove();
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.commit = {
    start: function() {
        var that = this;
        this.kag.layer.getFreeLayer().find(".form").each(function() {
            var name = $(this).attr("name");
            var val = $(this).val();
            var str = name + " = '" + val + "'";
            that.kag.evalScript(str);
            that.kag.ftag.nextOrder()
        })
    }
};
tyrano.plugin.kag.tag.cursor = {
    vital: ["storage"],
    pm: {
        storage: "default"
    },
    start: function(pm) {
        this.kag.setCursor(pm.storage);
        this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.screen_full = {
    vital: [],
    pm: {},
    start: function(pm) {
        this.kag.menu.screenFull();
        this.kag.ftag.nextOrder()
    }
};