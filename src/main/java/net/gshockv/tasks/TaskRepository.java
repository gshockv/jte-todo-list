package net.gshockv.tasks;

import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TaskRepository {
  private final List<SimpleTask> tasks = new ArrayList<>();

  public List<SimpleTask> findAll() {
    return tasks;
  }

  public void deleteTask(String id) {
    tasks.removeIf(t -> t.id().equalsIgnoreCase(id));
  }

  public void createTask(SimpleTask task) {
    tasks.add(task);
  }

  @PostConstruct
  private void init() {
    tasks.add(SimpleTask.create("Make a test call"));
    tasks.add(SimpleTask.create("Fix registered bugs"));
    tasks.add(SimpleTask.create("Attend daily meeting"));
    tasks.add(SimpleTask.create("Learn HTMX"));
    tasks.add(SimpleTask.create("Learn Java Template Engine"));
    tasks.add(SimpleTask.create("Provide a feedback"));
  }
}
