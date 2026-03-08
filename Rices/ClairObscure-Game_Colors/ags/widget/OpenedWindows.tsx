import Hyprland from "gi://AstalHyprland";
import { createBinding, For } from "gnim";
import Apps from "gi://AstalApps";



export default function OpenedWindows() {
	const hypr = Hyprland.get_default()
	const focusedWorkspace = createBinding(hypr, "focusedWorkspace")
	const focusedClients = createBinding(hypr, "clients").as(clients =>
    clients.filter(c => c.workspace == focusedWorkspace.peek())
	)
	
	return (
		<box cssClasses={["openedWindows"]}>
			<For each={focusedClients}> 
				{(client) => (
					<button cssClasses={["clientBtn"]}>
						<image file={createBinding(client, "class")} />
					</button>
				)}
			</For>
		</box>
	)
}