import React, { useEffect, useState } from "react";
import { WebsocketProvider } from "y-websocket";
import * as Y from "yjs";

interface Todo {
  id: string;
  text: string;
  completed: boolean;
}

const App: React.FC = () => {
  const [ydoc] = useState(new Y.Doc());
  const [todos, setTodos] = useState<Todo[]>([]);
  const [newTodoText, setNewTodoText] = useState("");

  useEffect(() => {
    // Connect to WebSocket server
    const wsProvider = new WebsocketProvider(
      "ws://localhost:8080",
      "collaborative-todos",
      ydoc
    );

    const yTodos = ydoc.getArray<Todo>("todos");

    // Observe changes in the shared array
    yTodos.observe(() => {
      setTodos([...yTodos.toArray()]);
    });

    return () => {
      wsProvider.destroy();
    };
  }, [ydoc]);

  const addTodo = () => {
    if (!newTodoText.trim()) return;

    const yTodos = ydoc.getArray<Todo>("todos");
    const newTodo: Todo = {
      id: Date.now().toString(),
      text: newTodoText,
      completed: false,
    };

    yTodos.push([newTodo]);
    setNewTodoText("");
  };

  const toggleTodo = (id: string) => {
    const yTodos = ydoc.getArray<Todo>("todos");
    const updatedTodos = yTodos
      .toArray()
      .map((todo) =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      );

    // Replace entire array to trigger sync
    yTodos.delete(0, yTodos.length);
    yTodos.push(updatedTodos);
  };

  const removeTodo = (id: string) => {
    const yTodos = ydoc.getArray<Todo>("todos");
    const filteredTodos = yTodos.toArray().filter((todo) => todo.id !== id);

    // Replace entire array to trigger sync
    yTodos.delete(0, yTodos.length);
    yTodos.push(filteredTodos);
  };

  return (
    <div>
      <h1>Collaborative Todo</h1>
      <div>
        <input
          type="text"
          value={newTodoText}
          onChange={(e) => setNewTodoText(e.target.value)}
          placeholder="Enter new todo"
        />
        <button onClick={addTodo}>Add Todo</button>
      </div>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleTodo(todo.id)}
            />
            <span
              style={{
                textDecoration: todo.completed ? "line-through" : "none",
              }}
            >
              {todo.text}
            </span>
            <button onClick={() => removeTodo(todo.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default App;
