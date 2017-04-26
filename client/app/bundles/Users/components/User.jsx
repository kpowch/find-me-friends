import PropTypes from 'prop-types';
import React from 'react';

export default class User extends React.Component {
  static propTypes = {};

  constructor(props, _railsContext) {
    super(props);

    this.state = {
    };
  }

  render() {
    return (
      <div>
        <div>
          {this.props.user.first_name} {this.props.user.last_name}
        </div>
        <div>
          <img src={this.props.user.profile_picture.thumb.url}/>
        </div>
        <div>
          {this.props.user.bio}
        </div>
      </div>
    );
  }
}
