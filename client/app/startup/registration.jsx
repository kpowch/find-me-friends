import ReactOnRails from 'react-on-rails';

// note app-bundles is an alias defined in webpack.config
import Profile from 'app-bundles/Profile/components/Profile.jsx';

// this is how react_on_rails can see React components
ReactOnRails.register({
  // expanded shorthand so it's easier to see. x: x could be replaced with just x
  Profile: Profile
});
