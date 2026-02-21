import { Astal } from "ags/gtk4";
import { createPoll } from "ags/time";



export default function Clock() {
	const clock = createPoll("", 1000, "date")

	const handleClockClick = () => {
    console.log("Clock button was clicked!");
  };

  return (
    <button onClicked={handleClockClick}>
			<label label={clock}/>
    </button>
  )
}
