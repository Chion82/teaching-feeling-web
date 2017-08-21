tyrano.plugin.kag.tag.playbgm = {
    vital: ["storage"],
    pm: {
        loop: "true",
        storage: "",
        fadein: "false",
        time: 2E3,
        target: "bgm",
        click: "false",
        stop: "false"
    },
    start: function(pm) {
        var that = this;
        if (pm.target == "bgm" && that.kag.stat.play_bgm == false) {
            that.kag.ftag.nextOrder();
            return
        }
        if (pm.target == "se" && that.kag.stat.play_se == false) {
            that.kag.ftag.nextOrder();
            return
        }
        if (that.kag.define.FLAG_APRI == true) that.playGap(pm);
        else if ($.userenv() != "pc") {
            this.kag.layer.hideEventLayer();
            if (this.kag.stat.is_skip == true && pm.target == "se") {
                that.kag.layer.showEventLayer();
                that.kag.ftag.nextOrder()
            } else if (pm.click == "true") $(".tyrano_base").bind("click.bgm", function() {
                that.play(pm);
                $(".tyrano_base").unbind("click.bgm");
                that.kag.layer.showEventLayer()
            });
            else {
                that.play(pm);
                $(".tyrano_base").unbind("click.bgm");
                that.kag.layer.showEventLayer()
            }
        } else that.play(pm)
    },
    play: function(pm) {
        var that = this;
        var target = "bgm";
        if (pm.target == "se") target = "sound";
        var storage_url = "";
        var browser = $.getBrowser();
        var storage = pm.storage;
        if (this.kag.config.mediaFormatDefault != "mp3")
            if (browser ==
                "msie" || browser == "safari") storage = $.replaceAll(storage, ".ogg", /*".m4a"*/".mp3");
        if ($.isHTTP(pm.storage)) storage_url = storage;
        else storage_url = "./data/" + target + "/" + storage;
        var audio_obj = new Audio(storage_url);
        if (pm.loop == "true") {
            audio_obj.loop = true;
            audio_obj.onended = function() {
                this.play()
            }
        }
        if (target === "bgm") {
            this.kag.tmp.map_bgm[storage] = audio_obj;
            that.kag.stat.current_bgm = storage
        } else this.kag.tmp.map_se[storage] = audio_obj;
        audio_obj.play();
        if (pm.fadein == "true") {
            var vars = jQuery.extend($("<div>")[0], {
                volume: 0
            });
            $(vars).stop().animate({
                volume: 1
            }, {
                easing: "linear",
                duration: parseInt(pm.time),
                step: function() {
                    audio_obj.volume = this.volume
                },
                complete: function() {}
            })
        }
        if (pm.stop == "false") this.kag.ftag.nextOrder()
    },
    playGap: function(pm) {
        var that = this;
        var target = "bgm";
        if (pm.target == "se") target = "sound";
        var audio_obj = null;
        if (target === "bgm") this.kag.stat.current_bgm = pm.storage;
        var src_url = "./data/" + target + "/" + pm.storage;
        if ($.userenv() === "android" || $.userenv() === "andoroid") src_url = $.getBaseURL() + "data/" + target + "/" + pm.storage;
        var audio_obj = new Media(src_url, function() {
            if (pm.loop == "true") {
                var tmp_obj = null;
                if (pm.target == "bgm") tmp_obj = that.kag.tmp.map_bgm[pm.storage];
                else tmp_obj = that.kag.tmp.map_se[pm.storage];
                if (tmp_obj != null) audio_obj.play()
            }
        });
        if (pm.target == "bgm") this.kag.tmp.map_bgm[pm.storage] = audio_obj;
        else this.kag.tmp.map_se[pm.storage] = audio_obj;
        this.playAudio(audio_obj);
        if (pm.stop == "false") this.kag.ftag.nextOrder()
    },
    playAudio: function(audio_obj) {
        audio_obj.play()
    },
    playSwf: function(pm) {
        var target = "bgm";
        if (pm.target ==
            "se") target = "sound";
        var repeat = 1;
        if (pm.loop == "true") repeat = 9999;
        var target = "bgm";
        if (pm.target == "se") target = "sound";
        var storage_url = "";
        if ($.isHTTP(pm.storage)) storage_url = pm.storage;
        else storage_url = "./data/" + target + "/" + pm.storage;
        if (target === "bgm") {
            this.kag.stat.current_bgm = pm.storage;
            this.kag.sound_swf.playMusic(storage_url, repeat)
        } else this.kag.sound_swf.playSound(storage_url, repeat);
        if (pm.stop == "false") this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.stopbgm = {
    pm: {
        fadeout: "false",
        time: 2E3,
        target: "bgm",
        stop: "false"
    },
    start: function(pm) {
        var that = this;
        var target_map = null;
        if (pm.target == "bgm") target_map = this.kag.tmp.map_bgm;
        else target_map = this.kag.tmp.map_se;
        var browser = $.getBrowser();
        if (that.kag.define.FLAG_APRI == true)
            for (key in target_map)(function() {
                var _key = key;
                var _audio_obj = null;
                if (pm.target === "bgm") {
                    _audio_obj = target_map[_key];
                    if (pm.stop == "false") that.kag.stat.current_bgm = ""
                } else _audio_obj = target_map[_key];
                if (pm.target ===
                    "bgm") {
                    that.kag.tmp.map_bgm[_key] = null;
                    delete that.kag.tmp.map_bgm[_key]
                } else {
                    that.kag.tmp.map_se[_key] = null;
                    delete that.kag.tmp.map_se[_key]
                }
                _audio_obj.stop();
                _audio_obj.release()
            })();
        else
            for (key in target_map)(function() {
                var _key = key;
                var _audio_obj = null;
                if (pm.target === "bgm") {
                    _audio_obj = target_map[_key];
                    if (pm.stop == "false") that.kag.stat.current_bgm = ""
                } else _audio_obj = target_map[_key];
                if (pm.fadeout == "true") {
                    var vars = jQuery.extend($("<div>")[0], {
                        volume: 1
                    });
                    $(vars).stop().animate({
                        volume: 0
                    }, {
                        easing: "linear",
                        duration: parseInt(pm.time),
                        step: function() {
                            _audio_obj.volume = this.volume
                        },
                        complete: function() {
                            _audio_obj.pause()
                        }
                    })
                } else {
                    _audio_obj.pause();
                    if (pm.target === "bgm") delete that.kag.tmp.map_bgm[_key];
                    else delete that.kag.tmp.map_se[_key]
                }
            })();
        if (pm.stop == "false") this.kag.ftag.nextOrder()
    }
};
tyrano.plugin.kag.tag.fadeinbgm = {
    vital: ["storage", "time"],
    pm: {
        loop: "true",
        storage: "",
        fadein: "true",
        time: 2E3
    },
    start: function(pm) {
        this.kag.ftag.startTag("playbgm", pm)
    }
};
tyrano.plugin.kag.tag.fadeoutbgm = {
    pm: {
        loop: "true",
        storage: "",
        fadeout: "true",
        time: 2E3
    },
    start: function(pm) {
        this.kag.ftag.startTag("stopbgm", pm)
    }
};
tyrano.plugin.kag.tag.xchgbgm = {
    vital: ["storage", "time"],
    pm: {
        loop: "true",
        storage: "",
        fadein: "true",
        fadeout: "true",
        time: 2E3
    },
    start: function(pm) {
        this.kag.ftag.startTag("stopbgm", pm);
        this.kag.ftag.startTag("playbgm", pm)
    }
};
tyrano.plugin.kag.tag.playse = {
    vital: ["storage"],
    pm: {
        storage: "",
        target: "se",
        loop: "false",
        clear: "false"
    },
    start: function(pm) {
        if (pm.clear == "true") this.kag.ftag.startTag("stopbgm", {
            target: "se",
            stop: "true"
        });
        this.kag.ftag.startTag("playbgm", pm)
    }
};
tyrano.plugin.kag.tag.stopse = {
    pm: {
        storage: "",
        fadeout: "false",
        time: 2E3,
        target: "se"
    },
    start: function(pm) {
        this.kag.ftag.startTag("stopbgm", pm)
    }
};
tyrano.plugin.kag.tag.fadeinse = {
    vital: ["storage", "time"],
    pm: {
        storage: "",
        target: "se",
        loop: "false",
        fadein: "true",
        time: "2000"
    },
    start: function(pm) {
        this.kag.ftag.startTag("playbgm", pm)
    }
};
tyrano.plugin.kag.tag.fadeoutse = {
    pm: {
        storage: "",
        target: "se",
        loop: "false",
        fadeout: "true"
    },
    start: function(pm) {
        this.kag.ftag.startTag("stopbgm", pm)
    }
};
tyrano.plugin.kag.tag.wb = {
    pm: {},
    start: function() {
        this.kag.layer.hideEventLayer()
    }
};
tyrano.plugin.kag.tag.wc = {
    pm: {},
    start: function() {
        this.kag.layer.hideEventLayer()
    }
};