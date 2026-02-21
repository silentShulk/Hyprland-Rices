import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"
import { createBinding, For, This } from "ags";

import style from "./style.scss";

import Bar from "./widgets/TopBar";



app.start({
css: style,

	main() {
		const monitors = createBinding(app, "monitors")

		return (
      <For each={monitors}>
      	{(monitor) => (
					<Bar gdkmonitor={monitor} />
        )}
      </For>
    )
  },
})