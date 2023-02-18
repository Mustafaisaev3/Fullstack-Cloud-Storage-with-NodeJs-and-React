import './App.css';
import { Route, Switch, useHistory } from "react-router-dom";
import { ManagedUIContext } from './context/ui.context';
import Registration from './pages/auth/Registration';
import Layout from './layout/Layout';
import Files from './pages/Files';
import Chat from './pages/Chat';
import Login from './pages/auth/Login';
import Home from './pages/Home.js';
import { useDispatch, useSelector } from 'react-redux';
import { selectCurrentUser, selectIsAuth } from './store/ducks/users/selectors';
import { useEffect, useLayoutEffect } from 'react';
import { SetUser } from './store/ducks/users/actions';
import { selectFiles, selectFilesState } from './store/ducks/files/selectors';
import ManagedModal from './components/UI/Modal/ManagedModal';
import ManagedConfirmationModal from './components/UI/ConfirmationModal/ManagetConfirmationModal';

function App() {
  const dispatch = useDispatch()
  const history = useHistory()
  const isAuth = useSelector(selectIsAuth)
  const user = useSelector(selectCurrentUser)
  const files = useSelector(selectFilesState)
  console.log(files)

  useEffect(() => {
    dispatch(SetUser())
  }, [isAuth, dispatch])
  

  useLayoutEffect(() => {
    if(isAuth){
      history.push('/')
    } else {
      history.push('/login')
    }
  }, [isAuth, history])

  return (
        <ManagedUIContext>
              <Switch>
                  <Route path={'/registration'} component={Registration} />
                  <Route path={'/login'} component={Login} />
                  <Layout>
                    <Route path={'/files'} component={Files} />
                    <Route path={'/chat'} component={Chat} />
                    <Route path={'/'} component={Home} />
                  </Layout>
              </Switch>
            <ManagedModal />
            <ManagedConfirmationModal />
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
  );
}

export default App;
