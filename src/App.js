import './App.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/stock">What's in Stock</Link>
            </li>
            <li>
              <Link to="/saved">Saved Shuffles & Ideas</Link>
            </li>
            <li>
              <Link to="/login">Sign up or Log in</Link>
            </li>
          </ul>
        </nav>

        <Switch>
          <Route path="/stock">
            <Stock />
          </Route>
          <Route path="/saved">
            <Saved />
          </Route>
          <Route path="/login">
            <Login />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

function Home() {
  return <h2>Home</h2>
}

function Stock() {
  return <h2>What's in Stock</h2>
}

function Saved() {
  return <h2>Saved Shuffles & Ideas</h2>
}

function Login() {
  return <h2>Sign Up or Log In</h2>
}

export default App;
