package net.gshockv.tasks;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TaskController {

  private final TaskRepository repository;

  public TaskController(TaskRepository repository) {
    this.repository = repository;
  }

  @GetMapping("")
  public String index(Model model) {
    model.addAttribute("tasks", repository.findAll());
    return "index";
  }

  @PostMapping("/add-task")
  public String addTask(@RequestParam String name, Model model) {
    var newTask = SimpleTask.create(name);
    repository.createTask(newTask);

    model.addAttribute("task", newTask);

    return "task_row";
  }

  @DeleteMapping("/delete-task/{task-id}")
  @ResponseBody
  public void deleteTask(@PathVariable("task-id") String taskId) {
    repository.deleteTask(taskId);
  }
}
