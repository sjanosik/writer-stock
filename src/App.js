// import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import {Form, Accordion} from "react-bootstrap";

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
  return(
    <>
      <h1>Welcome to Writer Stock</h1>
      <p>This is a bank of Genres, Themes, Tones, Basic Story Structures, and more that can be Shuffled together for writing inspiration.</p>
      <button onClick={basicShuffle}>Basic Shuffle</button>
      <Accordion>
        <Accordion.Item eventKey="0">
          <Accordion.Header>Advanced Shuffle</Accordion.Header>
          <Accordion.Body>
            <h2>Advanced Shuffle</h2>
            <Form>
              <Form.Group className="mb-3" controlId="formBasicCheckbox">
                <Form.Check type="checkbox" label="Include Base Stock" />
              </Form.Group>
              <Form.Group className="mb-3" controlId="formBasicCheckbox">
                <Form.Check type="checkbox" label="Include My Stock" />
              </Form.Group>
              <Accordion>
                <Accordion.Item eventKey="0">
                  <Accordion.Header>How many Items for each Category do you want in the Shuffle?</Accordion.Header>
                  <Accordion.Body>
                    You found the secret message
                    {/* ToDo: change accordion body to derive contents from database */}
                  </Accordion.Body>
                </Accordion.Item>
              </Accordion>
              <button onClick={shuffle}>Shuffle!</button>
            </Form>
          </Accordion.Body>
        </Accordion.Item>
      </Accordion>
    </>
  )
}

function basicShuffle(){

}

function shuffle(){

}

function Stock() {
  return(
    <>
      <h1>What's in Stock</h1>
      <p>Here's a list of the base Stock and any addition you make to the list. You can Favourite a Stock Item so that it is more-likely to show up in a Shuffle or Remove an Item from future Shuffles.</p>
    </>
  )
}

function Saved() {
  return(
    <>
      <h1>Saved Shuffles & Ideas</h1>
      <p>Here is a list of all the Shuffles and Ideas you have saved. You may edit, add notes, delete Shuffle, or add completely new Ideas.</p>
    </>
  )
}

function Login() {
  return <h1>Sign Up or Log In</h1>
}

export default App;
