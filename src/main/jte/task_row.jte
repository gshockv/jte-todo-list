@import net.gshockv.tasks.SimpleTask

@param SimpleTask task

<tr class="hover:bg-base-300">
  <td>
    ${task.name()}
  </td>
  <td>
    Pending
  </td>
  <td>
    <button class="link"
      hx-delete="/delete-task/${task.id()}"
      hx-target="closest tr"
      hx-swap="outerHTML swap:0.5s">
      Delete
    </button>

  </td>
</tr>

