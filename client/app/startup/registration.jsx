import ReactOnRails from 'react-on-rails';
// Refer to all React components for the app
// Note app-bundles is an alias defined in webpack.config
import Welcome from 'app-bundles/Welcome/components/Welcome';
// Import Profiles components
import Profile from 'app-bundles/Profile/components/Profile';
import Sidebar from 'app-bundles/Profile/components/Sidebar';
import SuggestionList from 'app-bundles/Profile/components/SuggestionList';
import Friend from 'app-bundles/Profile/components/Friend';
//Import Chatrooms components
import Chatrooms from 'app-bundles/Chatrooms/components/Chatrooms.jsx';

import EditUser from 'app-bundles/Users/components/edit';

// This is how react_on_rails can see React components
ReactOnRails.register({
  // expanded shorthand so it's easier to see. x: x could be replaced with just x
  Welcome: Welcome,
  Profile: Profile,
  Sidebar: Sidebar,
  SuggestionList: SuggestionList,
  Friend: Friend,
  Chatrooms: Chatrooms,
  EditUser: EditUser
});
