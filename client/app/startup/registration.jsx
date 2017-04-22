import ReactOnRails from 'react-on-rails';
// Refer to all React components for the app
import Welcome from 'Welcome/components/Welcome';
import Profile from 'Profile/components/Profile';

// This is how react_on_rails can see React components
ReactOnRails.register({
  Welcome, Profile
});