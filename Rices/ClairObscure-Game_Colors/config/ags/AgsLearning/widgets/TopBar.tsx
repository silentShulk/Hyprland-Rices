import { Astal, Gdk, Gtk } from "ags/gtk4";

import Clock from "./Clock";

import style from "../style.scss";
	


interface BarProps {
    gdkmonitor: Gdk.Monitor
}

export default function Bar({ gdkmonitor }: BarProps) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;
	
	return (
		<window
			visible
			gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
    >
			<Clock/>
		</window>
	)
}
