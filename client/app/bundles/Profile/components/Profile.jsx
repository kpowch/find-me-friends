import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar.jsx'
import SuggestionList from './SuggestionList.jsx'

export default class Profile extends React.Component {
  static propTypes = {};

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = {
      friendshipId: this.props.current_user.friendship_id,
      firstName: this.props.current_user.first_name,
      lastName: this.props.current_user.last_name,
      email: this.props.current_user.email,
      profilePicture: this.props.current_user.profile_picture.thumb.url,
      bio: this.props.current_user.bio,
      friends: this.props.current_friends,
      showFriends: [
        this.props.current_friends[0],
        this.props.current_friends[1],
        this.props.current_friends[2]
      ],
    };
    this.remove = this.remove.bind(this);
  }

  remove(friend){
    console.log(this.state)
    console.log('in profile remove function')
    var friends = this.state.friends.filter(function(fnd){
      return friend.id !== fnd.id;
    });
    this.setState({
      friends: friends
    });
  }

  render() {
    return (
      <div className="profile">
        <div>
          <Sidebar first_name={this.state.first_name} last_name={this.state.last_name} email={this.state.email} bio={this.state.bio} profile_picture={this.state.profile_picture}/>
        </div>
        <div className="list-container">
          <SuggestionList friends={this.state.friends} onRemove={this.remove}/>
        </div>
      </div>
    );
  }
}
