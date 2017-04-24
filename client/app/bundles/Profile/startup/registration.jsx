import ReactOnRails from 'react-on-rails';
// Refer to all React components for the app

import Profile from './components/Profile.jsx';


// This is how react_on_rails can see React components
ReactOnRails.register({
  Profile, Sidebar, SuggestionList, Friend
});