import './App.css';
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Registration from './pages/auth/Registration';
import Login from './pages/auth/Login';
import Home from './pages/Home.js';
import { useDispatch, useSelector } from 'react-redux';
import { selectCurrentUser, selectIsAuth } from './store/ducks/users/selectors';
import { useEffect } from 'react';
import { SetUser } from './store/ducks/users/actions';

function App() {
  const dispatch = useDispatch()
  const isAuth = useSelector(selectIsAuth)
  const user = useSelector(selectCurrentUser)
  console.log(user)

  useEffect(() => {
    dispatch(SetUser())
  }, [])
  return (
    <BrowserRouter>
      {/* {!isAuth && 
          <Switch>
            <Route path={'/registration'} component={Registration} />
            <Route path={'/login'} component={Login} />
          </Switch>
      } */}
      {!isAuth 
        ?
          <Switch>
            <Route path={'/registration'} component={Registration} />
            <Route path={'/login'} component={Login} />
          </Switch>
        :
          <Route path={'/'} component={Home} />
      }
    </BrowserRouter>
  );
}

export default App;
