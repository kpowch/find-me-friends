
import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar.jsx'
import SuggestionList from './SuggestionList.jsx'

console.log('do even exist over here in Profile.jsx?')

export default class Profile extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);
    console.log('this.props is: ', this.props.name)
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = {
      name: this.props.name
      };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  render() {
    return (
      <div className="profile">
        <div>
          <Sidebar user={this.props}/>
        </div>
        <div className="list-container">
          <SuggestionList friends={this.props.friends}/>
        </div>
      </div>
    );
  }
}
