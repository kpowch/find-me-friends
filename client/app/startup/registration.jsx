import ReactOnRails from 'react-on-rails';
// Refer to all React components for the app
// Note app-bundles is an alias defined in webpack.config
import Welcome from 'app-bundles/Welcome/components/Welcome.jsx';
// Import Profiles components
import Profile from 'app-bundles/Profile/components/Profile.jsx';
import Sidebar from 'app-bundles/Profile/components/Sidebar.jsx';
import SuggestionList from 'app-bundles/Profile/components/SuggestionList.jsx';
import Friend from 'app-bundles/Profile/components/Friend.jsx';
//Import Chatrooms components


import User from 'app-bundles/Users/components/User.jsx';

// This is how react_on_rails can see React components
ReactOnRails.register({
  // expanded shorthand so it's easier to see. x: x could be replaced with just x
  Welcome: Welcome,
  Profile: Profile,
  Sidebar: Sidebar,
  SuggestionList: SuggestionList,
  Friend: Friend,
  Chatrooms: Chatrooms,
  User: User
});
