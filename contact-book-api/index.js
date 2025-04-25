const express = require("express");
const bodyParser = require("body-parser");
const db = require("./db");

const app = express();
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Contact Book API is running");
});

app.post("/users", (req, res) => {
  const { username, email } = req.body;
  const sql = "INSERT INTO users (username, email) VALUES (?, ?)";
  db.query(sql, [username, email], (err, result) => {
    if (err) return res.status(500).json({ error: err });
    res.status(201).json({ message: "User created successfully", userId: result.insertId });
  });
});

app.get("/users", (req, res) => {
  db.query("SELECT * FROM users", (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

app.post("/contacts", (req, res) => {
  const { user_id, name, phone, email } = req.body;
  const sql = "INSERT INTO contacts (user_id, name, phone, email) VALUES (?, ?, ?, ?)";
  db.query(sql, [user_id, name, phone, email], (err, result) => {
    if (err) return res.status(500).json({ error: err });
    res.status(201).json({ message: "Contact added successfully", contactId: result.insertId });
  });
});

app.get("/contacts", (req, res) => {
  db.query("SELECT * FROM contacts", (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

app.put("/contacts/:id", (req, res) => {
  const contactId = req.params.id;
  const { name, phone, email } = req.body;
  const sql = "UPDATE contacts SET name = ?, phone = ?, email = ? WHERE contact_id = ?";
  db.query(sql, [name, phone, email, contactId], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: "Contact updated successfully" });
  });
});

app.delete("/contacts/:id", (req, res) => {
  const contactId = req.params.id;
  const sql = "DELETE FROM contacts WHERE contact_id = ?";
  db.query(sql, [contactId], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: "Contact deleted successfully" });
  });
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
