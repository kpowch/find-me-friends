import ReactOnRails from 'react-on-rails';
// Refer to all React components for the app
import Welcome from '../bundles/Welcome/components/Welcome.jsx';
import Profile from '../bundles/Profile/components/Profile.jsx';
import Chatrooms from '../bundles/Chatrooms/components/Chatrooms.jsx';

// This is how react_on_rails can see React components
ReactOnRails.register({
  Welcome, Profile, Sidebar, SuggestionList, Friend
});