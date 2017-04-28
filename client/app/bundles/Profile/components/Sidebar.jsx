import React from 'react';
import ReactDOM from 'react-dom';

class Sidebar extends React.Component {

  render() {
    return (
      <div className="sidebar">
        <div>
          Your Profile
        </div>
        <div className="sidebar-avatar">
          <img src={this.props.profile_picture}/>
        </div>
        <div className="sidebar-name">
          {this.props.first_name} {this.props.last_name}
        </div>
        <div className="sidebar-email">
          {this.props.email}
        </div>
        <div className="sidebar-bio">
          {this.props.bio}
        </div>
      </div>
    );
  }
}

export default Sidebar;