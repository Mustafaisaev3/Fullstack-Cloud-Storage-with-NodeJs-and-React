import './App.css';
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Registration from './pages/auth/Registration';
import Login from './pages/auth/Login';
import Home from './pages/Home.js';
import { useDispatch, useSelector } from 'react-redux';
import { selectCurrentUser, selectIsAuth } from './store/ducks/users/selectors';
import { useEffect } from 'react';
import { SetUser } from './store/ducks/users/actions';
import Layout from './layout/Layout';
import Files from './pages/Files';

function App() {
  const dispatch = useDispatch()
  const isAuth = useSelector(selectIsAuth)
  const user = useSelector(selectCurrentUser)
  console.log(user)

  // useEffect(() => {
  //   dispatch(SetUser())
  // }, [])
  return (
    <BrowserRouter>
      <Layout>
        <Switch>
          <Route path={'/files'} component={Files} />
          <Route path={'/'} component={Home} />
        </Switch>
      </Layout>
      {/* {!isAuth 
        ?
          <Switch>
            <Route path={'/registration'} component={Registration} />
            <Route path={'/login'} component={Login} />
          </Switch>
        :
          <Layout>
            <Route path={'/'} component={Home} />
          </Layout>
      } */}
    </BrowserRouter>
  );
}

export default App;
