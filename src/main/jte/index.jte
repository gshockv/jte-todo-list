@import net.gshockv.tasks.SimpleTask
@import java.util.List

@param List<SimpleTask> tasks

<!doctype html>
<html lang="en" data-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- DaisyUI compiled CSS -->
  <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css"/>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@5/themes.css" rel="stylesheet" type="text/css"/>
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <!-- HTMX -->
  <script src="https://cdn.jsdelivr.net/npm/htmx.org@2.0.8/dist/htmx.min.js"></script>

  <title>Simple Task Manager</title>
</head>
<body class="bg-base-800">
<div class="flex flex-col bg-base-800 mx-auto max-w-7xl min-h-screen py-10">
  <div class="px-8">
    <div class="sm:flex sm:items-center">
      <div class="sm:flex-auto">
        <h1 class="text-base font-semibold leading-6 text-white">Task Manager</h1>
        <p class="mt-2 text-sm text-gray-300">A list of all your tasks including their description and
          status.</p>
      </div>
      <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
        <form hx-post="/add-task"
              hx-target="#taskTableBody"
              hx-swap="beforeend"
              hx-on::after-request="this.reset()">
          <input id="newTaskInput"
                 type="text"
                 name="name"
                 placeholder="Enter a new task"
                 class="rounded-l-md border-0 px-3 py-1.5 text-white-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          <button type="submit"
                  class="rounded-r-md bg-indigo-500 px-3 py-2 text-center text-sm font-semibold text-white hover:bg-indigo-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-500">
            Add Task
          </button>
        </form>
      </div>
    </div>

    <hr class="my-8" />

    <div class="overflow-x-auto rounded-box border border-base-content/10 bg-base-100">
      <table class="table">
        <thead>
          <tr>
            <th>
              Description
            </th>
            <th/>
            <th>
              Actions
            </th>
          </tr>
        </thead>
        <tbody id="taskTableBody">
        @for(SimpleTask task : tasks)
          @template.task_row(task = task)
        @endfor
        </tbody>
      </table>
    </div>

  </div>

</div>
</body>
</html>