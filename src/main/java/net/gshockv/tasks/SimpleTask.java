package net.gshockv.tasks;

import java.util.UUID;

public record SimpleTask(String id, String name) {

  public static SimpleTask create(String name) {
    return new SimpleTask(UUID.randomUUID().toString(), name);
  }

}
