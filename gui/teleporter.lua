local captions = ritnlib.defines.teleporter.names.caption.frame_teleporter
local defines = ritnlib.defines.teleporter.names


local function getElement(gui_name)
    return {
        flow = {
            header = RitnLibGuiElement(gui_name,"flow","header"):horizontal():get(),
            namer = RitnLibGuiElement(gui_name,"flow","namer"):horizontal():get(),
            edit = RitnLibGuiElement(gui_name,"flow","edit"):horizontal():visible(false):get(),
            teleport = RitnLibGuiElement(gui_name,"flow","teleport"):vertical():visible(false):get(),
            dialog = RitnLibGuiElement(gui_name,"flow","dialog"):horizontal():get(),
            empty = RitnLibGuiElement(gui_name,"flow","empty"):horizontal():visible(false):get(),
        },
        frame = {
            main = RitnLibGuiElement(gui_name,"frame","main"):vertical():style("frame-ritngui"):get(),
            top = RitnLibGuiElement(gui_name,"frame","top"):style("frame-bg-ritngui"):get(),
            submain = RitnLibGuiElement(gui_name,"frame","submain"):vertical():style("inside_shallow_frame"):get(),
        },
        label = {
            title = RitnLibGuiElement(gui_name, "label", "title"):caption(captions.titre):style("frame_title"):get(),
            info = RitnLibGuiElement(gui_name,"label","info"):visible(false):get(),
            namer = RitnLibGuiElement(gui_name,"label","namer"):get(),
            enter = RitnLibGuiElement(gui_name,"label","enter"):caption(captions.label_passenger):get(),
        },
        button = {
            close = RitnLibGuiElement(gui_name,"sprite-button","close"):spritePath('utility/close'):style("frame_action_button"):mouseButtonFilter():get(),
            edit = RitnLibGuiElement(gui_name,"sprite-button","edit"):spritePath(defines.sprite.button_edit):style("frame_button"):get(),
            valid = RitnLibGuiElement(gui_name, "sprite-button", "valid"):spritePath(defines.sprite.button_valid):style("frame_button"):get(),
            down = RitnLibGuiElement(gui_name,"sprite-button","down"):spritePath(defines.sprite.button_down):style("frame_button"):get(),
            up = RitnLibGuiElement(gui_name,"sprite-button","up"):spritePath(defines.sprite.button_up):style("frame_button"):get(),
            teleport = RitnLibGuiElement(gui_name,"button","teleport"):style("confirm_button"):caption(captions.button_teleport):get(),
            empty = RitnLibGuiElement(gui_name, "button", "empty"):style(ritnlib.defines.teleporter.names.styles.ritnFrameButton):caption(captions.button_empty):enabled(false):get(),
        },
        line = RitnLibGuiElement(gui_name,"line","line"):horizontal():get(),
        text = RitnLibGuiElement(gui_name, "textfield", "namer"):get(),
        list = RitnLibGuiElement(gui_name,"list-box","teleporters"):get(),
        empty = {
            empty = RitnLibGuiElement(gui_name,"empty-widget","empty"):get(),
            dragspace = RitnLibGuiElement(gui_name,"empty-widget","dragspace"):style("draggable_space_header"):get(),
        }
    }
end


local function getContent()
    return {
        flow = {
            header = {
                "frame-main",
                "frame-top",
                "flow-header",
            },
            namer = {
                "frame-main",
                "frame-submain",
                "flow-namer",
            },
            edit = {
                "frame-main",
                "frame-submain",
                "flow-edit",
            },
            teleport = {
                "frame-main",
                "frame-submain",
                "flow-teleport",
            },
            dialog = {
                "frame-main",
                "frame-submain",
                "flow-teleport",
                "flow-dialog",
            },
            empty = {
                "frame-main",
                "frame-submain",
                "flow-empty",
            },
        },
        frame = {
            main = {"frame-main"},
            top = {
                "frame-main",
                "frame-top",
            },
            submain = {
                "frame-main",
                "frame-submain",
            },
        },
        label = {
            title = {
                "frame-main",
                "frame-top",
                "flow-header",
                "label-title",
            },
            info = {
                "frame-main",
                "frame-submain",
                "label-info",
            },
            namer = {
                "frame-main",
                "frame-submain",
                "flow-namer",
                "label-namer",
            },
            enter = {
                "frame-main",
                "frame-submain",
                "label-enter",
            },
        },
        button = {
            close = {
                "frame-main",
                "frame-top",
                "flow-header",
                "button-close",
            },
            namer = {
                "frame-main",
                "frame-submain",
                "flow-namer",
                "button-namer",
            },
            edit = {
                "frame-main",
                "frame-submain",
                "flow-namer",
                "button-edit",
            },
            valid = {
                "frame-main",
                "frame-submain",
                "flow-edit",
                "button-valid",
            },
            empty = {
                "frame-main",
                "frame-submain",
                "flow-empty",
                "button-empty",
            },
            up = {
                "frame-main",
                "frame-submain",
                "flow-teleport",
                "flow-dialog",
                "button-up",
            },
            down = {
                "frame-main",
                "frame-submain",
                "flow-teleport",
                "flow-dialog",
                "button-down",
            },
            teleport = {
                "frame-main",
                "frame-submain",
                "flow-teleport",
                "flow-dialog",
                "button-teleport",
            },
        },
        text = {
            "frame-main",
            "frame-submain",
            "flow-edit",
            "textfield-namer"
        },
        list = {
            "frame-main",
            "frame-submain",
            "flow-teleport",
            "listbox-teleporters",
        },
        empty = {
            dragspace = {
                "frame-main",
                "frame-top",
                "flow-header",
                "empty-dragspace",
            },
        }
    }
end


-----------------------------------------
return {
    getElement = getElement,
    getContent = getContent,
}