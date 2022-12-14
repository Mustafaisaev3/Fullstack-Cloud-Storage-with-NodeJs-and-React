import './App.css';
import { BrowserRouter, Route, Switch } from "react-router-dom";
import { ManagedUIContext } from './context/ui.context';
import Registration from './pages/auth/Registration';
import Login from './pages/auth/Login';
import Home from './pages/Home.js';
import { useDispatch, useSelector } from 'react-redux';
import { selectCurrentUser, selectIsAuth } from './store/ducks/users/selectors';
import { useEffect } from 'react';
import { SetUser } from './store/ducks/users/actions';
import Layout from './layout/Layout';
import Files from './pages/Files';
import { selectFiles, selectFilesState } from './store/ducks/files/selectors';
import ManagedModal from './components/UI/Modal/ManagedModal';

function App() {
  const dispatch = useDispatch()
  const isAuth = useSelector(selectIsAuth)
  const user = useSelector(selectCurrentUser)
  const files = useSelector(selectFilesState)
  console.log(files)

  // useEffect(() => {
  //   dispatch(SetUser())
  // }, [])

  return (
      <BrowserRouter>
        <ManagedUIContext>
          <Layout>
            <Switch>
              <Route path={'/login'} component={Login} />
              <Route path={'/files'} component={Files} />
              <Route path={'/'} component={Home} />
            </Switch>
            <ManagedModal />
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
        </ManagedUIContext>
      </BrowserRouter>
  );
}

export default App;
